#!/bin/sh

echo '===================Configuring wireguard...======================'
echo "-e serverprikey=${serverprikey:=$(wg genkey)} \\" && export serverprikey=${serverprikey}
echo "-e clientprikey=${clientprikey:=$(wg genkey)} \\" && export clientprikey=${clientprikey}
echo "-e serverpubkey=${serverpubkey:=$(echo ${serverprikey} |wg pubkey)} \\" && export serverpubkey=${serverpubkey}
echo "-e clientpubkey=${clientpubkey:=$(echo ${clientprikey} |wg pubkey)} \\" && export clientpubkey=${clientpubkey}
export interface_name='wg0'
/root/setup-wireguard.sh
wg-quick up ${interface_name}
echo 'Wireguard has started'
echo '============================Done================================='
sleep infinity