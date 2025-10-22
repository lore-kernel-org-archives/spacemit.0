Received: from dog.birch.relay.mailchannels.net (dog.birch.relay.mailchannels.net [23.83.209.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6071E51EF
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 20:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164323; cv=pass; b=htNdr99bfJvTdxlGyoZvPaDBGBASw1nNVUKUE0V6EaOT1sieiSPeiT6TUzLYP86L5Ofk6ATe5UJhkq9c51+nnmpz59suYjtpAHhPqxXP6s2cr5BxGj2WrZ3rxbCkUcm1QVKL5kjYsw29vOroWNBOm1SBJnHLhXXqs3rgfTfrm38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164323; c=relaxed/simple;
	bh=JUXGLQl6ji5Smt/xarEs8H5cmDcT3No1jxJLAMOM2gk=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=g7+09ZQQOtCLtdt/n5C0HJA4qR+k2EMeD4k1myjFI8mNRjNuST2OonVYTErF+etGDFjWxcnIoGQ4jRdzYYbTTLXefDi1tGzAeRe6alSVf1EeNdYO3Z1LsNxcMpqlAhBgoxWBSo668GNpBpfAEOAGKz8166nMS1M6iHiVYHNsxAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=HgTwIF6V; arc=pass smtp.client-ip=23.83.209.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="HgTwIF6V"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 984EB8628B1;
	Wed, 22 Oct 2025 20:18:34 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (100-119-46-77.trex-nlb.outbound.svc.cluster.local [100.119.46.77])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B6BDA862AB6;
	Wed, 22 Oct 2025 20:18:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761164314; a=rsa-sha256;
	cv=none;
	b=ueOUCgEl41wzxkte4PDwOXN+JvW6HbERPL85nD1ARF+fzxixA5zO9pQdCXjDbRqYdT/6Xp
	4xviFb1kzqAuSuFJZTGImbupNKj5G5rTJQbiX4m7hLPuuVFSRMtWdyYJ7RxWE4a5dRkOuE
	lSK0WBav/myZ83QOpzcYiyn4E8SvVhgbeTYwX7vibiv+dMquWZYr90fJepIXE1i0FyhvQo
	VoWnfmk9MSpavGwHxt0zoxlP/qzlmssz5zcB9fPa2UxBDYrm4tBt40gLGnGQue4fmqV7hw
	qD6sKxvmlT3nr2718+viX8VXj3fShFT2s2sPmGAkPt7wFzeQohz1NlSSqlanCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761164314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=zlIhL+KvAED04UHxi7f1xwB6S5ErUDZ6ZXS6BPJSze0=;
	b=xbjdl2RkQ7lpNOcgtX5KgoierO3hYGLCpCggVDsp8GlhIRIfe2NbJtotWc9Y5CxEAbv3w2
	BhTuuD/pc1XHx2v2D8N8uNTtgx3adiWiaKuWXZMphIetAkwgRl4Jw/uuhZHfNbHpALqF0K
	8ApKBAeRknqtppy5wikKGXvXB+X/L1+HAllIkRItq4I7s7mbKLM1Jc3lpkIPuudpgNVxoA
	k/ALaHIFIiSUYOlWhA8BhQCcmQfV2D5A9Rzuet8DeYWpow6AlvnNOPV0p9S3d3x67IZzXF
	M5qMW5evtvvF6qBfx2fUWbPAZQsWg5//uxl/K4ZFHgC7BOJC3XgoI6hM3Uvpbw==
ARC-Authentication-Results: i=1;
	rspamd-5b5956c7c7-jkqg2;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Imminent-Lyrical: 7478f977349eefe4_1761164314430_4120514996
X-MC-Loop-Signature: 1761164314430:2886540681
X-MC-Ingress-Time: 1761164314430
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.46.77 (trex/7.1.3);
	Wed, 22 Oct 2025 20:18:34 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:df8b:aa61:9538:1b7a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4csL8Q2HsXz3wmL;
	Wed, 22 Oct 2025 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761164311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zlIhL+KvAED04UHxi7f1xwB6S5ErUDZ6ZXS6BPJSze0=;
	b=HgTwIF6VVLTUt/lvdwrJhJTdhhRaRx3ZKv5bRQaEJ7qChkpG5I6LLzfP3gG+S4n7PNDrFZ
	aIZ5azNIFuh4Jy422E5NOnFM1POZfPDAZJjOTfFZ0ClFgLEifCQUOsLoEjMQhmVzIxVyZD
	3Bm6HqyK68IicfkpP86BCoVIahAGRa/00NtY32wL9WuyvoXhHY/hW+xX0TmLgD7e5Nte8k
	dzW32mmJGcyhVuTtS3CUA/ltnKrfLE6E80+ZDSYeDuzFvCdJH+jBY6/yXsMRKT3RNBF+70
	y9AGkuF4iq9/Hq7e5/W79QQOh+BwHAZFQst25Vi/6YPl+0em0TBotsrJbT1j+w==
From: michael.opdenacker@rootcommit.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 0/1] Add Ethernet and PDMA support to OrangePi RV2 board
Message-ID: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 22 Oct 2025 20:18:30 +0000 (UTC)
X-CM-Envelope: MS4xfFmowE4IR1mzi7AMnHjbCLbiwaA+NRaBIJ0ukirBskSUPgIG9isHTFF5ZkwKh7KxscQuBb6z0IHvlcyJ/XjDXN3QDZFyCfU7L8wUbUwygpwC6MkIv/7F DYKrw0F86oh9ZtEtJUWOdKNP5xI/9RgYSX6C0VDL2vWB+4ha8684b0JCPSajOHMYo3Pa1Ch+k1yU2MzEccPlwiCux56Iyac41c/7Woqi8LDiciTI1V1o6/B6 QCi0qk8tVuKq0vAO44IWyu/XlN1izZ5szMU3bwDa+bvyjvItryvHfzkq2ihTMf+Pfp4eat6Gx8XCa+ePxtVm0PQMABc5LzNUjf318FNrt1wxIYjbaQBXhND6 2DnN9+Cp25GUnEZ0wtgzZFwnGBFtHXDUDhiRIPeFniNqU0zdJVRr734Jm5ArKDlpMv8UFJ9XeUe85eRO0axX4VGTQbEdqeDOwpTz+Xp6wt2JfFHvIK5EiHSs oB3QT/T94C+Mra+NFHGH/dxZSfpWDBI4DQggWe3kTSINj+f6njS/L44918ztG71O+PESKPV8fSJikczqkrmd0qwXA8HQU6EyFmhnum7WMOfalJhmGPYKQ6jh GEVMCcXSG5Y9R28/Gf6mlHYq
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=68f93c17 a=XzW6OEp4kASjoDH3AA+DzQ==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=7mOBRU54AAAA:8 a=HsGs3wCgiyq6zIFpwXoA:9 a=NcxpMcIZDGm-g932nG_k:22 a=wa9RWnbW_A1YIeRBVszw:22
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Reusing DTS code from the BananaPi F3 board.

iperf3 tcp performance results:

Eth1 client test (iperf3 -c <server-ip>)
[  5] local 172.24.0.2 port 41914 connected to 172.24.0.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   946 Mbits/sec    0    378 KBytes
[  5]   1.00-2.00   sec   112 MBytes   942 Mbits/sec    0    424 KBytes
[  5]   2.00-3.00   sec   113 MBytes   947 Mbits/sec    0    424 KBytes
[  5]   3.00-4.00   sec   112 MBytes   939 Mbits/sec    0    445 KBytes
[  5]   4.00-5.00   sec   112 MBytes   944 Mbits/sec    0    445 KBytes
[  5]   5.00-6.00   sec   112 MBytes   937 Mbits/sec    0    445 KBytes
[  5]   6.00-7.00   sec   113 MBytes   944 Mbits/sec    1    445 KBytes
[  5]   7.00-8.00   sec   112 MBytes   936 Mbits/sec    0    445 KBytes
[  5]   8.00-9.00   sec   112 MBytes   943 Mbits/sec    0    445 KBytes
[  5]   9.00-10.01  sec   114 MBytes   944 Mbits/sec    0    445 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.01  sec  1.10 GBytes   942 Mbits/sec    1            sender
[  5]   0.00-10.02  sec  1.10 GBytes   940 Mbits/sec                  receiver

Eth1 server tests (iperf3 -s)
[  5] local 172.24.0.2 port 5201 connected to 172.24.0.1 port 58420
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   112 MBytes   935 Mbits/sec
[  5]   1.00-2.00   sec   112 MBytes   942 Mbits/sec
[  5]   2.00-3.00   sec   112 MBytes   941 Mbits/sec
[  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec
[  5]   4.00-5.00   sec   112 MBytes   942 Mbits/sec
[  5]   5.00-6.00   sec   112 MBytes   942 Mbits/sec
[  5]   6.00-7.00   sec   112 MBytes   942 Mbits/sec
[  5]   7.00-8.00   sec   112 MBytes   942 Mbits/sec
[  5]   8.00-9.00   sec   112 MBytes   942 Mbits/sec
[  5]   9.00-10.00  sec   112 MBytes   942 Mbits/sec
[  5]  10.00-10.01  sec   512 KBytes   897 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec  1.10 GBytes   941 Mbits/sec                  receiver

Eth0 client test (iperf3 -c <server-ip>)
[  5] local 172.24.0.2 port 60496 connected to 172.24.0.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   947 Mbits/sec    0    362 KBytes
[  5]   1.00-2.00   sec   113 MBytes   945 Mbits/sec    0    464 KBytes
[  5]   2.00-3.00   sec   113 MBytes   945 Mbits/sec    0    464 KBytes
[  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec    0    467 KBytes
[  5]   4.00-5.00   sec   112 MBytes   940 Mbits/sec    0    467 KBytes
[  5]   5.00-6.00   sec   112 MBytes   937 Mbits/sec    0    467 KBytes
[  5]   6.00-7.00   sec   113 MBytes   948 Mbits/sec    0    494 KBytes
[  5]   7.00-8.00   sec   112 MBytes   938 Mbits/sec    0    520 KBytes
[  5]   8.00-9.00   sec   113 MBytes   945 Mbits/sec    0    520 KBytes
[  5]   9.00-10.02  sec   112 MBytes   919 Mbits/sec    0    520 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.02  sec  1.10 GBytes   941 Mbits/sec    0            sender
[  5]   0.00-10.03  sec  1.10 GBytes   940 Mbits/sec                  receiver

Eth0 server tests (iperf3 -s)
[  5] local 172.24.0.2 port 5201 connected to 172.24.0.1 port 42930
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   112 MBytes   934 Mbits/sec
[  5]   1.00-2.00   sec   112 MBytes   942 Mbits/sec
[  5]   2.00-3.00   sec   112 MBytes   941 Mbits/sec
[  5]   3.00-4.00   sec   112 MBytes   940 Mbits/sec
[  5]   4.00-5.00   sec   112 MBytes   942 Mbits/sec
[  5]   5.00-6.00   sec   112 MBytes   940 Mbits/sec
[  5]   6.00-7.00   sec   112 MBytes   941 Mbits/sec
[  5]   7.00-8.00   sec   112 MBytes   941 Mbits/sec
[  5]   8.00-9.00   sec   112 MBytes   942 Mbits/sec
[  5]   9.00-10.00  sec   112 MBytes   941 Mbits/sec
[  5]  10.00-10.01  sec   512 KBytes  1.07 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec  1.10 GBytes   941 Mbits/sec                  receiver

In comparison, for the 6.6 vendor kernel in OrangePiOS:
- Client tests give similar results both on eth0 and eth1
- Server tests are very similar on eth0, but lose
  between 50-60 Mbits/sec on eth1:
  [ 5] 0.00-10.00 sec 1.04 GBytes 889 Mbits/sec 56 sender
  [ 5] 0.00-10.01 sec 1.03 GBytes 882 Mbits/sec receiver
  (as seen from the PC client)

Changes in V2:
- Remove the commit configuring k1_emac driver as a built-in by default,
  as suggested by Emil Renner Berthing
- Improve the message for the commit adding Ethernet and PDMA,
  as suggested by Yixun Lan
- Add DT aliases for eth0 and eth1
  as suggested by Vivian Wang
- Add iperf3 test results to this cover letter
  as suggested by Vivian Wang

CC: Emil Renner Berthing <emil.renner.berthing@gmail.com>
CC: Yixun Lan <dlan@gentoo.org>
CC: Vivian Wang <wangruikang@iscas.ac.cn>

Michael Opdenacker (1):
  riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

