Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867096;
	b=0UZCSbREyWQjkkBatInxK0ZwSOhF9RjIEL1FtflgZNV6fp8TUgSf8bbx2bivn43zV7zx
	 aomO/R/LQ/2CdG0GQR0MIH+hQkaE7WYRYUFku3FtnxHyedbNeD6nJlYRG+siIXZFVyz/K
	 dNNhtldOJJupyiFjNCtiB8EHtl2uVWJVwB9mud2W6vgRbDG7z19dAUR1d8sResGaHnTHT
	 eFvBmDTxdE8GRx800qsm9jAPnwjusyfKPsAB6oi/0dXVKI63TKp0GuygqI0dCls6mV9du
	 nDDM1YNxbAkFTJiHcU/KqxNRrHJ9Y781nZ4H5wMc4o9SXMyDJT2Lhg/WG/sROzX5Rjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867096;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ZJ249AtmwSuCZsIIsSDb7ydrGHQ516oqgxihKKAwghE=;
	b=Vp3RQTC4RAxXwJXgHG5ZM7aL/o/T6GzIZvVMawogUaQ2kjU7/rcrN/ntO7NIyJgCBzPf
	 B6FixT399J9CdTgA5/NBFlZ7zcXp9OPlwRaPMi9zP+sB5VXcxWyhc0y2nvUMAaxJ1OG/v
	 WXEewCWuqNw4CytaYr4S9ftNrAsMay93ow6wr6ZRieWbr8DpLl1W4m5huaN/t2DLPHSyy
	 bqedGb9hCNj0LUBJ/I92UkTdpDLHtriw8ypEfdiFgQ0OexbGsye17JDhbaOkqIfc++qGR
	 As/ecVJbsIPpYUjK2WMajgbUGH/a6R8sfEz/jhr/IGS+66Ne6/91o6Gfw3h+P8PaxfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ejh5VaEX;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3622B606A326
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3622B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ejh5VaEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867049;
	bh=ZJ249AtmwSuCZsIIsSDb7ydrGHQ516oqgxihKKAwghE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ejh5VaEXKo5X4pSwhBx9obfWqL9P31aPI11Z8vPwOdWDgIiPSdsj3O838TVlycE5B
	 XmRRJtlJdAtKa6BKmya+EloOym8zhBTupABRfpjIpzD90kKp096C2c0/OHvMEp0z0l
	 1UolzRd2jDfeRZ450u+TtKE8e2f3ptcHHdH/36aA=
X-QQ-mid: zesmtpgz4t1793867048tf3e3ee76
X-QQ-Originating-IP: iZG4yoHhf8J3fsBiHX52Fhia9VgMbLyclOKJK/7Bw84=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264579372122570667
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:49 +0000
Subject: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=8xFU6VvJImZA2MbPgp1OYJlmNmjSbxKEyOFL+rbF1NI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEVuXHzh/eF4jYeN3aEbZnN2z9+6e9PPOymRP2vaG
 PT2uMTP7ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiI4haG/05XCvXD2T1Ul5Q9
 ZPI917/yvnvX3r+HIwzj7vE837fK/BDD/9wTnzqnVZ+9/0n551w3g9eL7l/r4elw/z+lwnNfgdX
 /CG4A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NK5b7h72e0qHl3uo/lwlGSe/y7aqnuFmDUyskkHSIR26qdR9u2VgCNAR
	/RFEDxyUrLxeJsNq6UldRxwFEbSUqqPf/7ZgmDATtSt5J1v/sZeQNG0uICBS6N1kkr8oGk7
	YfAasXFGWH3+ZV3AzUTC8hfsOMQK26sPnTB8tyBkO/ie6qyENF24CiX0qhSPBDjsag/T1bD
	emw43IrOicCIubcLWxrlGFpq0pktNEY4aZ4xH59wzpIJlIn7dWHI2Eh20Sdjk5oMM0vyT2R
	d8RYu/n+9+LOfmCuEeq4F3VXE4t0EsnxpHWnQESbvniknM7M2haFycMdepWXU/RJ0Im57mU
	zPrnxE6EtIak7hFZuwG2M8uXzeF1yStWKNN6t8IXjLyM7ckurkiBpWA7YX5I+ps8UODCR0D
	2za0o60YBMReEdhyikEhfTGnT8yyCfTjB+Lf1vOkowb0gJIBJKS4V3AlbeOxIqfk0CvhLT0
	G3AfVoC0FAab1FTdlyWcRcY85ETw7YOXr1q02dDO9J2ba2EN2dtuKcsza42yOaPjp25Sn5S
	0dpdVfJA6zBGz7h26JlQ+9VoD4VEV6ltJjqC1NjZZujaDrU13H7crJ6UdKOcmTObStelgG/
	WRSakW2kQKUBGAxw4toWzTGyJ2MkkNTf6Iz0pV+I4Cu/GAHJD+smS8/ws5yzoUddxL2uSPt
	cxigfQsHBAzdQ/VxipXJ4DhMdk63K3DjP68ML0E37CNBIQuC1YeuCHx10JJwvfrntK2j3Nr
	l70dL1Ktn1PP++RrGfVlF0V28DkTMZ86/ZpctsA40+ujK7VjfN1Af7Rxj7b2Dhw2mMWPl+A
	aLEBhj+Zl+v0j/BTOqYHaAiJwuWSxpUjx2nVAHmWjFtyzSIGfj3iATFGwQbK+OiwEON2+k4
	ORibv+wX1kt7swD2O4qCJJIlcht/txrWmPZUL1QtF3jtqrMsCg9OrjCU9D10EsIN0M4yoD+
	ofg6iqPTFH5e5cjfI+sB+0ZRrYcXIpCjXkZRN35jcxNFQhcbCXA/2MJ8Zic8aGlQ+T30N7f
	GvY0kqyCkxsB04XDbHfdo6y34pMgmJMPbXPhfYIEf6tc9BOLNBLgFrRBKqsAQwSOhnffJAv
	q2KuoBtUylKO5clsdQsjPz1fCXM/GCZ5ta7Ni9jqLuQckEI8clAmbgrfY0gg8pLJbXvj3LK
	cM8c
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
MAC address the same way. Without the EEPROM driver and the ONIE TLV
layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
Ethernet controller never probes unless the bootloader passes a MAC
address in the device tree.

Enable both drivers as built-in so the MAC address is available as soon
as the Ethernet driver probes, including for network root file systems.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..a76f801d8eed 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
 CONFIG_LIBNVDIMM=y
+CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
+CONFIG_EEPROM_AT24=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y

-- 
2.56.0

