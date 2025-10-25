Received: from seashell.cherry.relay.mailchannels.net (seashell.cherry.relay.mailchannels.net [23.83.223.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FBF219A79
	for <spacemit@lists.linux.dev>; Sat, 25 Oct 2025 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761378330; cv=pass; b=RhjwLMt2F5cZzptr1yB/q6LQABPaQp5Bb6HmCYeCtEF/cloapZhPOpW0SEVGXKUjXRFQRSEEStRttAzARvyiazQgsJu0AygKhaENUjrq7X9dOgvknX9FftzoA6TSdMzBoIg7ypEBJtB+0EovVjPAawpxz7v1tGRNXDhLHt1CYPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761378330; c=relaxed/simple;
	bh=E+S6VfdtpCi7czhvZ8BFjGUra6ANRutAuQNuObaYcl4=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=fWRKf1EcxWJzqE0QYkqSAJzanCfTbOEDWi8eCMKnBEI1ewgmCv91tjFprzt8whidfoGlzZCPQXaaQ0saeSi5bEN3yud1UQMQf3T0d3vqcSW/x71nQvEfogqlQu61PaZh5/TR+0+4X8I929YlBN99BVWzzOaSuEZvi5Xjgm9tAX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=TpxG/ySx; arc=pass smtp.client-ip=23.83.223.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="TpxG/ySx"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B1E967E09A4;
	Sat, 25 Oct 2025 07:45:20 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.118.36.55])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BC3D67E073B;
	Sat, 25 Oct 2025 07:45:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761378320; a=rsa-sha256;
	cv=none;
	b=k912f5h8HBWQPgEiHVq/YxkAG40rC1zrjviZ56TLF7uQm4EFJH9+6jyS81uCOsLhlly8qP
	avu1PEk+5yllY9PpVIrdvVjJ409O03dKUrxOvj+UaurHXJ55sPQSBulm3Tba6nMg+922Q7
	tRXhPcdbhkxZXmKXIKVbPf4y4Y+CbfrPd8SI2rJ2+jYzP2cdJxUsgYBJ7d5W32NgRP6lvs
	atebZQ/cEBd5uoum4H66A4OreNQvoL1JVO2viuWxc75ro7D9xPuv/SH/s6kxUsgHcyVEfl
	hrACOvefKgB4pcIpy1f675ZjZyqrJ0TPJ2JiKUg5sOChRvb+xWpTtu1ujKua+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761378320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=yf/KU2rVejUQ3FVC7JwkdlH0KC0lI6UCRu28wq31Ljg=;
	b=obcZVOjpZgMAZc3MBKVgbQ9egnt2Ekk5qjkeGEpGuC+nCvXwCX5P8Si9DgV3fxt825f0Pw
	QZ7rQKszwe3SzgL8Vqbg0c8KS8DCyHY8aFDUGj1HxVCgTjrkbS1evMaa5TX+Pk8ehqb9If
	1535ZP8GsOIwBysYYyX9WCuhrfUjEXyUfSINVDa3Tb16gkVEBnEV/9xQJTCN5jgbDomEhm
	S8HGW9DMZk2H+vCPVt1FoO01taQR9mSMBg2geGb5W0K8co5oQ15rtutmH0FTJEJBlPbKuM
	l4xvBIo0yTR+YI7X1/4b/BhnIa07ZRr06lITorT+mk6P9Ct+cpXhIJIFwodlag==
ARC-Authentication-Results: i=1;
	rspamd-9799b5d46-sdctf;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Unite-Arithmetic: 4c66191c27c7defd_1761378320453_1368303078
X-MC-Loop-Signature: 1761378320452:3529311946
X-MC-Ingress-Time: 1761378320452
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.118.36.55 (trex/7.1.3);
	Sat, 25 Oct 2025 07:45:20 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8260:6f14:f559:44de])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ctsHx6VPQz1xn7;
	Sat, 25 Oct 2025 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761378318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yf/KU2rVejUQ3FVC7JwkdlH0KC0lI6UCRu28wq31Ljg=;
	b=TpxG/ySxaiL9bXWcvbiakUBOdSFHiwLeERpYvp4yIUUZw/1J8MXSJT3qKykp9CdiYIxnvH
	wnlecrm7rM52MkgNllJk3pK62X7Tp0oME6G1GHLvnMDCswmlDnx+lwtdYgx1qYeX+pup+8
	/YTgUtqU2dbKrKFkE4YhAPio2FwxKfQy0q5QKeE1xh2r00ezWEuPUgElL2njWpmy5htex/
	/BBvLZMXRa6wBWpBHth0PQ2UChlHriE7xRTykJ3t75UEPUYTL5eA7II8J1IXQapmL5j+Xh
	GbR56GObPAdFgmqz9htlE0YiXrx7ousOV+MFCUJysLaQ913SYqnxzCP8G127Mg==
From: michael.opdenacker@rootcommit.com
To: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [RFC PATCH] riscv: dts: spacemit: initial i2c support for OrangePi RV2
Message-ID: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Sat, 25 Oct 2025 07:45:17 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=68fc800e a=rByZg85q4TxBe4aD0HbSyg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=7kg-g6J3WR51fJ073mUA:9 a=J8eEqglTx5LDgDqmzts8:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfODzyBdtS7KSUxaSmBV0yHybknaV6wf8DwaU0wxxyJby/Vwps5PPymE992Xz9yz8RZmvNQPm47zxkc937Xl8BANXw6hUt8BmD5/G9rwEh4mwykHhKCC0 BdXVSSJgr0aHnsKT5lsFIODovpV4kXg+HTfv3kO2LItXXLOcpkm0v/S1ofvRIU+3fphV/HeXC4fArC8KlEB41NVafMP8GwSYel234pe3YX4+uqKW/chrY7yw 50LtfHAD4lilDkLq1kQmxz3YwrzVhcTmJA2IqmCaj0B8FJd2MoZprox+0IvNLsIRIn5oEFYVzHj8Qo7KFxKPmgl2MJ7z6nJ6B2GcMRDDylM4grKDjcD0Lzgt V2ULaQNJIqc+Ds32L0x/36dkstGXHQ==
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

The OrangePi RV2 board exposes i2c2 and i2c8 buses from the Spacemit K1 SoC.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 41dc8e35e6eb..c4b25dd30f54 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+                i2c2 = &i2c2;
+                i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -81,6 +83,18 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pdma {
 	status = "okay";
 };
