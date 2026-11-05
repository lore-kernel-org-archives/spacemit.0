Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867107;
	b=FkDCULXdlHIAa7MbF7tl1e6edT+PvbVjUctKsWcg+f+cgGgoEWILa12WsAVSErqNjq5T
	 7n8F9qEtiI/FE8NHCIYb042iKN2RrBMpXKOh6A3AZ8iw9I757CTEj1jMXqUWMfn5kU+3E
	 Vv9FMqHR2sO55GnQm6rInoyL9ay0hnRR7nhwMQRqhSR+/ZsoMeEoYCqJS77cPGzmrE/kr
	 h0J8tLV6DXQmzhgIfJ96wY+UZXPVFrsrQcOrKMU3QR6+8kwdHIRHCavDkVh9njw5oEF6a
	 mzPliX2+zERix7V54gJwLdoz0YOmTsjRd0mPvsqj5Dk8M3x5INMvyStfq+xYM6r3i8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867107;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=BeP9abbyuRADpO9tnoSCSAKZO63Jhkhje3D0pWwoNIw=;
	b=IwNxjuEKfaOJ2wTGX9ivbO1k8CUW6S/b3s6beGV9w+Lm/ZMJKY/x5gygJzWlUvCQQSv0
	 C6Jojg6WE1XwwSbgLYwQMkDH3l1u8LUIiLCym78vyciw6fapLbYhBrqNnn1Yh/uGiKxu0
	 n6DIhw1pAVNLaavXfL6ubgIzcrmu+wrUUlu9qRkdPphknEs0YcDxQOEMh3Ca+Twiic6p0
	 mBtc9Pdz4UMq/tGUaNOF46yWvOF5JEN/Kiu7WDDgFgikiwTAjQyPauS6afAHanDErgQXj
	 5QCQDNMfFhDf6Glp6Unm0z1lmasYlqokBhK6hsCRD1ap/29ZNC0+dHH708IeajmPLJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Iuz2OVSs;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF6D606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF6D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Iuz2OVSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867053;
	bh=BeP9abbyuRADpO9tnoSCSAKZO63Jhkhje3D0pWwoNIw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Iuz2OVSsP8SPiXTU/qhyEhZS6w2BtkyvrKE8bfjLM5H8pWcujjQTzO1QecB1jIxJE
	 o7/8xsnk/ew+1gnya7zy92QRi8gAaYRkCMmH/y6BwtwQc468ApghSaGdTnxSO/QqLA
	 wg/0NDbGAI7m1iOjYMx/Yh6CE/L+so5mGImlnfNU=
X-QQ-mid: esmtpgz11t1793867052tca6bfb24
X-QQ-Originating-IP: feuNNwSfwKUpywoniGYAh6GBHSA4qT2mk7H4i1Lilj4=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3347373038067916414
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:50 +0000
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-com260: Set Ethernet MAC from
 EEPROM
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=qFPgZ4k0mozVoqhTFNoQ7QRNK6lvGtsHRAAIgvK5R4g=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEWuzf34v61HMVzu9qcVXXnaf8Mje2Mi26c9/9S8x
 +d4ngxrRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwET8mhj+KTK5HtkWlH/5ysTk
 6JAG2aLCSxecgjNOJzAzrJ1Sep/tBCPDtqTcmyJ1VqFVLFkRz9c/2uO1/tmC9IssPKfPbb764Ps
 iRgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MzOrCbSXFQdfbPpMec9TkpiZkLfXp6P6XWjwK0P+OoDYnnETu/uza61p
	8SC6jdq15yK7uZThzNKNdxwbsg1gR3CurBYB9CI85zG+dxwTbQCOjUZqDoq1aTLltCljuJr
	XbblYLHb8G5GTN75j6qszg8KQHk/+O5CEvjAU+2bRh0cfJuwtoImnWyAEWiKCSJM7DT4x7z
	N9b8wz8gDgW9yJX23dAtg88Y0vVi5q03bWnFbS5hzC3ZX07YWlYGwwl55UysQQjjPXEu458
	+cp7uqR5r8BBj+uZ1joQ0tNWluEX+IBjeWI33kg6+RVXETxanX536FRWPLD72diKcf5Y5x8
	irBCpTNHvGgNPyLMgKD4XUgf+r4AwBvjSgrn664A2D08ODWxpKP272KYkUEOGuyDOaR+Xb1
	wSoCcMOjhJ3GRN/yfRWLDKy7CBZ7X7hpi7grHjAbGnZBpmc38KkBZxX21h8uF6vRyUHgz05
	Z1UEaeo0QofysqfDaStmUGhhTQPtI0dpEbcPidPV8GPs/nkGMv6DsJ95W4IWU/gZ2CVuCEQ
	xA477ncs8w6IGv1CzUcCyrB+4BAIy7j3ipZ6/5NOJBqVJJdoTsa75bB3IXt5BxaGSQ6bw8P
	/ozLhwlJn9MipwyqS3nWuMKDFfwyIli8xeg0hrNdo0oLi5Rra+UNrkYC2pQ+HT+yZRHWu7i
	zuP70c40QBkNMDxHtLUnpr1SfD90VxGjOQaPB/A50gjbxMXbT6dN6XQX3hKpbrJksUDoV7S
	8ZeVxvK/l0MRc681vvzaUPmnkgI/i0iMRNx1x+3yftlHVtQBcAiNt7sgLF8dzDigbYixuCv
	DHgtJscfPHN1hF4KRwD14mja5apfPxKtSuZaT4cQdnDBS8GL+04mm0SqJelJ+1jzfD+0/QL
	IhCNLmN3WWSuMVqdfM80mtppbQVkeY3GN23YujNX73jfjURp8O4uOWDCE/+bCZEFt7F4MoE
	oKdrECeW1BhU95swvL510MKB2jOqwkcBRA2MjKdaZYiEEMjK0oNa4OaqMR8vY3h65wEYgLs
	WmyXoJ3GBMH6gEI9mXfOUNtaHxp9KYqVzsytgeJkgjrcHp2RRa/gYLUKkTSDJEuiLu372JO
	1XpCbc/8cms5qC/QPlJFnRJLAQdE3WqHigqxezEXROqaFxE6baPTnVh2mXHRWTkhw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The EEPROM on the K3 CoM260 module stores the board MAC address in its
ONIE TLV data. Assign it to the module's Ethernet controller, so that
every carrier board using the module gets a stable MAC address instead
of a random one.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index f94607cb2eeb..1f5c958c9d6d 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -42,7 +42,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
@@ -216,6 +216,8 @@ dldo7: dldo7 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac1_rgmii_0_cfg>, <&gmac1_phy_0_cfg>;
 	phy-mode = "rgmii-id";

-- 
2.56.0

