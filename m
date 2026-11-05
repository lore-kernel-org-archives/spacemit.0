Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867096;
	b=SkEV+cn30GGknqWRzq0hL3zlAOle8hR/GPKAxZT9/pUpV++KdE4+KKGLyF+kB35nFDU5
	 uj7Txse0M7yoHtGLJg6W4gpFSKM9StHSmT5vXJv+kPpR3h0fqRR6vurT64q98iIhHFyJ8
	 1xJDTs0t9hZw+876hOvu8t8ZOoPDp8xVT6WcmBjQfnQiSwBVGtKDDvq88SiJwJs8Kb9zW
	 7eh/Qgta6fl0NJgqGYJatwV5ABNwZFqZSkzO76j/gvEdojewIvF1NeQPTWzaS2WQjN9ni
	 c2vharTHIcJlNaruddV4CP4R3+BQyL3+saYT6W98AKwhhsQtnosGjKJH9qUAEow306w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867096;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ex5QciF8HsRuD6/z7Bnz92BFaI2r9RvhM5A2PdC/ryk=;
	b=G7/OZUXEyZtzdmsOJS7KKHMLh03OMp9x5JDA2CclfLyB9WMciZ0F3zISfCT/uuQXDTey
	 bxOiqsGhEge30XO0elOEgSlC3KuYta2diCyapHWwAXuVEmZ9lkVJgKHOxeuK2nxv39cCH
	 VlRdvWp1jvegOlQLu23fzHq/e7lP8MgBqAS2Pu2lHk2Q4FQgmtbW27jTyDe+o9hlYnp4b
	 /URQxu7cqi3/0NnJlfYse2pbeqnNb7nqp35/KvC7gb54NCOJfElH/hOnuzjqJOQilNf4+
	 mDbAmeF3gfnzHWA8ZPBav/m24lZeO1MpwGkJX126LAIBWghzBMqrCqlVxzAIGp3gZBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ti+0JCyg;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E4606A328
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376E4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ti+0JCyg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867042;
	bh=ex5QciF8HsRuD6/z7Bnz92BFaI2r9RvhM5A2PdC/ryk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ti+0JCygyDlUpJxysiAR+jbOJwOHWW8/sS74ZrWCtI0lHnduuwCcgiSDuhJalF4Zi
	 zOvgjyrWjzj2RqrBS21ajLabaQlpd05WsFQVk+z7BZq9fVWWJ1ngE2wG8ZAb6tmo5W
	 OGnHCSLuJrNfj9yrz0x2u1sfLKWAzyuULYxAE3Us=
X-QQ-mid: esmtpgz13t1793867040tc4a0437c
X-QQ-Originating-IP: o6lwSprFVEZUSfcqPwVGLLBhBzK/F2cLTxbydJuQmYo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6585883940759934299
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:47 +0000
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-com260: Move SD card to the
 module
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=FW3v+X/LP3K9lLC4PILHOwlmTUeSvDKD94xp6NZYOuw=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEU+GO6Z71S3biWL2vpfdyr33M1fULEsTOfj83188
 teffDO93FHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjCR4GSG//lqBhuif75SK2DP
 b71lcDZhr8OHgH8zj/I9YYzX3zclN53hv4eEAX9EG9fedYWtMwKvOPJkBK/8bNzxWn5BTqPJ1AW
 mvAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MmjslNbgB3jamTJrc8F+c+vDArg7XfFN+JuTVmtGT1SJMtLhJwKPm6wz
	FSnFxFu1unWTdjcqaFbA0vy8oXv6CyHK5uugzbQVQA7vUFmOVwOoZw2QOJQ0D7oh2D6WeqY
	TzKdavVXfxL9ITrmIXuiDD/LclyZ/jFnbcKLZ4HzAp9BTqGxYRErG7b82OUwsGvGZB5EP88
	cHmKx0esjy3KnaTFIpEgpANp0YsvetYxRj+UEU4wMVfKUNhJuO/vi9Zxg3YxOZbN+5HCayU
	MArPXs166zasAR2uAFxksVvSJXVz/DbYfmBtxqYC1bMkEYGqJ4Xscc0eG5nVpc0xXQgOsv+
	DU3y4YKpnU3KKaga0pbyi6nfa3+stHov43NNvQYRyPZL3ufHdeqSK+g08h3XjNt+0ulQwZD
	3C7tHmE1BmaqTA8zsDjWoLR2CXpHRlYUq9Rrp5/UJf2QfYSZSWpkgkQhDxd7280Tx6pGzBo
	h8yVQRL790gCTi5Wvv+9M07JFWSubje/VtW9h9SAwwiTl7ks/f3qqU4qYVGrFf9IisIOsNt
	xjdWQCpJjT0qm4eiZZ4fdL235MGttHV4qoUBSgFaP9pfi04hd7d1/w8tKwBcIgeNHIrlK/Q
	x5jCsAlUAUImZH65z8Lax0XdfmkBqBMREL0THucp+Rlq5LRBrG2+voNo2hEwFX39KFs0JVy
	Xl8kRtgIypkqXtg56iqVr8Uz75lsLV4j/dLH6krX9UYc7S010boN3hVE2FwY/DcjzNc5GX1
	cW46nrt5Bp6Va0V0LDb+9E+REMynn2AmEpwbnUuRJ7VEBmuWESOi9vRSZ1DnxWcomhtooLX
	bBdkW3CRtGbtG6SlwmTgyhXFilR97sH5xyUFGWOMtKYHs6JeUcmHTPemRhZwue7wDAtPsyo
	CTnmxHU4uwpV03t+Jpb2iU5EIf1KlXoD0Jp89GL8S8aQgskT3zPSoqnrAis+cMEiJ8dV30e
	Hjfzys31D3crk4ICR2qA1nOjeDDcBRewd6OgxUNDuWNM4y/BQYSHmK0VzlL1ij1XaH5BVZ1
	o7QA3koPse8oRBXKiYGpiC6mMrKAkyxI8vPhVu1j79FRu8/pMA2ecMa9xm/EKDWlJYNgCLP
	qlqGYKU5WA2+fnu83+j8KLw0ZRJ5T1FBHRdCDKkCFYdnYW7w2U/3RZzax6VIduFaJCJry9S
	KEciPz1mKHW1se8=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The SD card slot, its power supply and the signal-voltage switching
circuitry reside on the K3 CoM260 module. Describing the slot only in
the IFX carrier board leaves other CoM260 carriers without this shared
hardware description.

Move the SD controller configuration into the module include without
changing its properties, so every carrier using the module inherits it.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 17 -----------------
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 6e295bc6f196..38809d01df82 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -111,20 +111,3 @@ hub_3_0: hub@2 {
 &usb3b_u2phy {
 	status = "okay";
 };
-
-&sdhci0 {
-	pinctrl-names = "default","uhs";
-	pinctrl-0 = <&mmc1_cfg>;
-	pinctrl-1 = <&mmc1_uhs_cfg>;
-	bus-width = <4>;
-	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
-	no-mmc;
-	no-sdio;
-	disable-wp;
-	cap-sd-highspeed;
-	vqmmc-supply = <&aldo1>;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 054bfff7413a..f2df797a2c80 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -233,6 +233,23 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;

-- 
2.56.0

