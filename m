Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919183;
	b=tyzGkJdowVdlzWlNaG7198EO9OsuLkYCjFTFZw0YLq3/+kJ6cn0T9ism5XcnWBNWTl5Z
	 K13Rp/WHCILQtMoE6EI7/x12BukXJ6XN2B4qOOg7892jma6g0Ife11jAZygThTcRipiHQ
	 3CLDuC7NBe0CNHmCDzdC/iPIcL1bJTb1przlsI0FIbujx7OBHBRmEgyU2i1Clm7njzQWe
	 e89oCNh25rAi94PXOznff0Hy82vvOyQu3GBMnk/Ap4OFc+qI55SK6EkcqjdT2rhT4+cQJ
	 QqnWBfBMmz5egvBVNPCcnQuuJkZZ6egZRmRtPigBMjI0JdOlQH1WPKFt13QJ8UJSvRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919183;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=CQs8yOC4qlgYdYPEE/Hd5eDHwv6uNPSMlM13mTV36EU=;
	b=5Q/YYT9NRCza2kY7pBonO/4XTepA014OZoyKsZ9Vo31+U59+49g4O3HrKdKr/WtK5PUR
	 iXqT4tmvCW9maG8GgZnUBqb2UXRHQfElcmQWXjD5b33AdBBhaBDrRUFMV3BMORFk85D6F
	 mYowiIW5+zFNk9rWQYPZKomI3G1Qe7ldIlz5Rp8uXjDft9DnpdHBxT4cHFuR13TyCRCUW
	 AAIAqtM4f8bDnjkz+CkLA1eDW3V7WhGirJSTdY9Pz4tVIh5rmVJ+W6wX5iOFP+7Rk8+Ic
	 A8X6zzC83T1lsHq6JYlh95HWJ3ro9u+5hmGDnR1MxbcCBZEcmAWQUrBV1/VW3vUjaNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=E20r3c9J;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3012A606A31C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 12:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3012A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=E20r3c9J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919159;
	bh=CQs8yOC4qlgYdYPEE/Hd5eDHwv6uNPSMlM13mTV36EU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=E20r3c9JlhXNgPC3heuKD/189fu6zIX9Q69Nj21JI1Rhp6t9f2JGSD/XU2h5ochyq
	 n3Rf2H6rB+HTrk3IJCH6ja+lxSUvA9I/H2WGaxbueHG2OYk+fVOdOZBS6+QVVRvlYk
	 77JoGyR3CBfGwvig88dmEdEXS3i2nf0LWRx4x/70=
X-QQ-mid: zesmtpsz6t1794919153t7a6e2926
X-QQ-Originating-IP: vRAHI7qxW8TfwigGmSJSPLYxtJRLVPJYExsO5HE+VgE=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12991783526982754364
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:49 +0800
Subject: [PATCH v5 7/9] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
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
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-7-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1213;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=1INXjO+Im/ugaM5JZKucTtKwbca9TtSPK6qmT5NUkkM=;
 b=7Us2h0HiYr02hzULLqs/nv1oQvVBXDVAGH18Ahss0UEhUrJU7pfw6xsl1vwPq6SWtZ/M+cKu8
 WJSiOhdcyyXA5DGtEcUsBOHGGTa8Z1XIRzSoZqTl6HOZRe6iVsnBTA7
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OZsapEVPoiO6WTztfOElqFVyceVGXNwVEr6MN2spSl2oAqJdoQPFakp5
	HG/zLYKY3Gk8MPyCBgMpcnqtlNVkLL59DtkC7tnuzh5OzE8kU39DOYOaUHFvxjZF3f9yZWz
	aYVl3mq7gALc6F5nBjt9rCW4r2XW8WrMraB/yDVUquTGjFY/nPA6mz5ie50olM+E+pPOqvR
	cLkCglW/c3Rmq8prxCdn8CRdgQcoB6EowaOyNPOAxgLCmR4//PGn3y89Df98JnAGNIwLEVh
	LKZOGPpY+ltflIL7xlsyH014NI/OClDa1nlSPiL8Coc0JC2RxvSUJaZmgmufQ+Q0EsMhRNF
	NZk9lIpmQJp2sZBgRNZ9o1jkK/yzm5GdvNUPAIQc4mgquz1fLpRPZor1E/9vdxo4TWqO0cr
	zJ6RApu9jY0DhEmISItQZfXayjzmMQkapHwVIgA4YhEj3yc3fSVh2PlwhyxO7WSR/2nvUyc
	yNY3Vp2Dlq2nwMdw/LjrTuclcngyyUQCIqCiPdHPqpOgWzxb4mJpH6czh9hZ9gFRGnRrO90
	oqOmT+ngjG0OV3uwpvN8ipPir95d06w7OAQeLuBr6w0DcwKhOw6ckyD/qGco/7PULvUaY49
	PFxg2B9woLMhyq7PG14h2Ha10HZaftkc5hj27vIj9VBX6XWj4f4seg6m48TAtY6ErMHn4+X
	OGYZhzE86TQoygxN1fGInhTsUhnd31xxOQpe2n1cpeUMapnLRA+1IdM36ApTF2L9UnmxnNa
	wD1ETpBP8VkKgrwD3WhJEMQ4HPoigB8bZRP7yM6LkH9NBEwDB60j3L17LRX4bpqePr7jlvD
	S/SubmH2lSfbFx4UA5fvMSuQXT071/AZQBiKJR2xLI4ovQs59acf2sFMUmHBtbkFWb7/oUx
	rO0gzu8+uKIzibGp+cNZy/sKFwFS+Lnn1bZEul6kzrRbqc6wBRBwlIdviJNB695EDCxZv5n
	5WVyoIytnpL3bygL7p/YFIRBkj5Ay0KzvxMM5dU939KRNn9GAZjxV9cJo9TgRvTKTd/PZ85
	3eLwQcDpHUyPuKBXhIVIFoqssroWLVDr/sVcyq+qujBSLV1UuDz37TmU84CFAMe3mNuyTD/
	YqOKG3C1CRv5/9HoheKSTmE5lJaer0z30MOZuO5LtyYY/uCHXPcOID6KwlXST6FDma6D/lT
	NQup
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886bf6..ce36250e2deb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -383,10 +383,26 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

-- 
2.34.1

