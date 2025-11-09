Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE526E161
	for <spacemit@lists.linux.dev>; Sun,  9 Nov 2025 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762727401; cv=pass; b=UOXT35BTkAiAvFmfpzmlE9puE3n+6zpPuwVw9UDIUI1K4JyC7IdxGm61NfPKy+iXmS5htf4vVyrzHg2RKOKSc0hv5zc1lgOZFga59XljYX7XWbEjPUOQB1CZ5OAyYo4wqsin5CsNZoy0uHV+ajyrFmdgM1p9qdr0/h2O8xAVjHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762727401; c=relaxed/simple;
	bh=3fIQqNPpVhskP+4qQXQHPAaJSg6xZ42pJEExd0PVtlQ=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=cx6hy5/gdMu/LyZaRAoxH9uVDNS+l5+j51PtVHCFJqDB3oEBonBikTzsIb1zbl70WYkh39smxOYyj/syvhevIBVXkuer2lUXMw0sJyIoy0B/cigDgAm9s3pWQOOY1A12YQU3Y+u2Kl3RZ84EIo3mhKumoT8DpO26ig3S0vUt2zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=L2yz3yRd; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="L2yz3yRd"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 94238220ACA;
	Sun, 09 Nov 2025 22:29:52 +0000 (UTC)
Received: from fr-int-smtpout22.hostinger.io (100-124-9-98.trex-nlb.outbound.svc.cluster.local [100.124.9.98])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E430D220AEA;
	Sun, 09 Nov 2025 22:29:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762727392; a=rsa-sha256;
	cv=none;
	b=2BXi7ho1MadCofxJQhqm1rtjn3Bv3uq8JodsWvUrYp6C+XGaDaZ5QUIA2nA1J0KxnMT2x0
	nt1I4fyl091TPCkL1FwL9OkPgwmlYwae/YBC9bh7EgPyJHLg89i8U1aAF7tJvskJXLbPkv
	tsiff1zLAIrxVKl2sMTmy5nCX1W6XykkNFZWg27AfMQKho2SyqblN9guc2YQj0TnbeFbkd
	ToezihZMHLmYoE/hFpdt3ood97lDdn932J/D8MSfe1cnnTngBZvEswR23hluskzdKx/Si8
	CW75tZZnHVk8OCebx2DeDBCRTxObtWo8EhOg7KBdFs3y4Zjv0b/hzvV4G+7hbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762727392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=Ru34N4selYo9viAPMWabFFJS3gW6c5Y2PpEo3z7X0LY=;
	b=mO31EXNyQYnC5FllGtx0tdFT/QMAZ/b26Scrv+2LuH3tnQEDhonKzCBjexwLLg0gvlRywE
	G1dSN9knHrvmlRFzqlYbbyEP60QzhMmhF9W2wv8hFqz+QqvUvBJ2Ju62l0x7XXjdvXeidA
	MiZitnV6Iq5sOQiyIKuZT2kPoL6w8NCKVygCmU5nWCPBYmnvuVWnGvMVqJr7GQF7lnudOa
	KtgTiHagGqxtbuWbcXPl+UUvBq5RQ5HfZST/Zf7Skm2kuImmtqiJ3TbElgu2xT+Ji4sRzb
	CauoeZFr950KZdDeImP6nKKqClTdxoxY/hK4U8BR4IqV3iuFjZPufh085ZAqyg==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-9nvpf;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Grain-Abiding: 0578b90f707261fd_1762727392441_4163200070
X-MC-Loop-Signature: 1762727392441:1815207509
X-MC-Ingress-Time: 1762727392441
Received: from fr-int-smtpout22.hostinger.io (fr-int-smtpout22.hostinger.io
 [148.222.54.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.9.98 (trex/7.1.3);
	Sun, 09 Nov 2025 22:29:52 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:6854:e5c6:92e9:8517])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4SCc2rF0zySw;
	Sun,  9 Nov 2025 22:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762727389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ru34N4selYo9viAPMWabFFJS3gW6c5Y2PpEo3z7X0LY=;
	b=L2yz3yRdutYdl747a48xErxuIDCzBxa6BVTHZSxf+11K7xDq4dVyKdGjdAg6CBrv+p3zR+
	fp0kMWlfPdClQaXzT00gpV8Dydp5Rn+mrcLJS3eBlvEMVi8pOfTsAsUrtokgQ9zl9mkwsB
	O1Mw9Nv10U8hbeLoNcammPTGXCyXVmj3YG6m/FNovBw1iCzKvd02svYQJUaHU5VUHEmhQR
	cz1OYQ7exe+5q1kyVzVE/VA9L9+uRavv9cm+73lf5wn0wBD1/aaKUG0uJBK6ryGH6o4zRs
	0QCyxrGG7IZnP4Un++2rCBW3d/geYlBB/B7b+M5wm6hGrdS8wZPYyq7V+aITrw==
From: michael.opdenacker@rootcommit.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/4] riscv: spacemit: initial support for OrangePi R2S
Message-ID: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Sun,  9 Nov 2025 22:29:48 +0000 (UTC)
X-CM-Envelope: MS4xfMokmvdpkaf6V5fmCJDeJDSWB/QJ89cdTklaMvFxtMuqzJBVDzPwOTPHFkcHmn4iE3s6pd95IPyTYfLFRLbaGDfbRt/OUZ6BDd4PckdyRHpdKMyr3eFw KvgAdySSKLC9YGG9asZmO8dUx8m6G6ndm9+gODzx1AnLPfs919gJRwJGg4ML8FcoAhh2EHss1KG2jlyOXTFjcPpnIrL9cC1kpfYQ6isX1pr8T4AMXfplyIOH Slnm5/Ji/o3IKKD+XAbD6pMvScIW+9VdqBpalLfjU+cuhzMRgYH6QVI3W3BEuAZMgI3/rrnxsd8UEGrp8wcn5Bm4aUqT1r9QhVrWvWUSHJX5pHWVq4xCrhtw oE3Jve/sJ9+wA314s7Z+Vz/EfV1uVtbs6xC1HyJ947ox4eYM2dKjpx7YHuJ9f06nnQKoqNPP+9Y9N9xBgZoK3Rug44V99IDYbz2TU8r9kKdbn5NfNHTpBlDl ou4n00tmzghXNbxjivezZHzLkj/P1DCeR6514/apt2q5w7uvQgWIoE3YqmI=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=691115dd a=9hvhlO9olek7/vweJUpOAg==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=RGFltW2CodX66KyrsG0A:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

This adds initial support for the OrangePi R2S board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

What makes this board attractive is its 4 Ethernet ports
(2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal PCI Express bus),
its small form factor and its attractive pricing like other OrangePi boards.

What is supported:
- Serial console on serial UART
- 8 GB eMMC
- 2x Gigabit RGMII Ethernet ports

This patch series is based on Spacemit's Linux tree, "linux-for-next" branch [3]

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/spacemit-com/linux/commits/k1/dt-for-next [3]

Michael Opdenacker (4):
  dt-bindings: riscv: spacemit: Add OrangePi R2S board
  riscv: dts: spacemit: Add OrangePi R2S board device tree
  riscv: dts: spacemit: add Gigabit Ethernet and PDMA to OrangePi R2S
  riscv: dts: spacemit: add eMMC to OrangePi R2S

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 90 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts

