#ifndef QUICCLIENT_H
#define QUICCLIENT_H
#include "../MsQuic/include/msquic.h"
#include <absl/strings/cord.h>
#include <condition_variable>
#include <mutex>
#include <sys/stat.h>
#include <QObject>

class QuicClient : public QObject {
    Q_OBJECT
public:
    const QUIC_API_TABLE *MsQuic;
    static std::condition_variable cv;
    static std::mutex cv_m;
    static bool disconnected;

    explicit QuicClient(QObject *parent = nullptr);

    Q_INVOKABLE void connect();

    Q_INVOKABLE void Disconnect();

    Q_INVOKABLE void send(const absl::Cord &message);

    void ClientLoadConfiguration(const char *cert, const char *key);

    QuicClient(const char *Host, const uint16_t UdpPort, const char *cert,
               const char *key);

    _IRQL_requires_max_(PASSIVE_LEVEL)
        _Function_class_(QUIC_CONNECTION_CALLBACK) QUIC_STATUS QUIC_API
        ClientConnectionCallback(_In_ HQUIC Connection, _In_opt_ void *Context,
                                 _Inout_ QUIC_CONNECTION_EVENT *Event);

    static QUIC_STATUS QUIC_API StaticClientConnectionCallback(
        _In_ HQUIC Connection, _In_opt_ void *Context,
        _Inout_ QUIC_CONNECTION_EVENT *Event);

    _IRQL_requires_max_(DISPATCH_LEVEL)
        _Function_class_(QUIC_STREAM_CALLBACK) QUIC_STATUS QUIC_API
        ClientStreamCallback(_In_ HQUIC Stream, _In_opt_ void *Context,
                             _Inout_ QUIC_STREAM_EVENT *Event);

    static QUIC_STATUS QUIC_API
    StaticClientStreamCallback(_In_ HQUIC Stream, _In_opt_ void *Context,
                               _Inout_ QUIC_STREAM_EVENT *Event);

    ~QuicClient();

private:
    QUIC_CREDENTIAL_CONFIG CredConfig;
    uint16_t UdpPort;
    HQUIC Connection;
    HQUIC Registration;
    HQUIC Configuration;
    QUIC_STATUS Status;
    char *Host;
    const QUIC_REGISTRATION_CONFIG RegConfig = {
        "Client", QUIC_EXECUTION_PROFILE_TYPE_REAL_TIME};
    const QUIC_BUFFER Alpn = {sizeof("nexus") - 1, (uint8_t *)"nexus"};

    uint32_t DecodeHexBuffer(_In_z_ const char *HexBuffer,
                             _In_ uint32_t OutBufferLen,
                             _Out_writes_to_(OutBufferLen, return)
                             uint8_t *OutBuffer);

    uint8_t DecodeHexChar(_In_ char c);
signals:

public slots:

};
#endif // QUICCLIENT_H
