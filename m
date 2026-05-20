Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207E305674
	for <spacemit@lists.linux.dev>; Wed, 20 May 2026 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282393; cv=none; b=oTOcRdJ7MzLvszQg3kaNntCZhIH/OB+U/YGBcD8f0h4ylkeTcWekM1wIrTfCvkCLQ2vuqRMtXNXrflOP3JAD2JmyS9OJcp28YKSoGEIefbs61Kg4sGIbNpPgRZf3dNx+wCsrkV9OCM28QTswHuSpIUrcvOnTWtPfNyadW3dtb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282393; c=relaxed/simple;
	bh=MyyMxbHX/jzj54c8s808sA/jSnaAMjMXtqmmODzzfHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUvuyzqBscLDTmHS5QGT3eHgZbR+fNSve5XElUdwwvhKeg4CtobfC3G7MarSfHb8OvPz+QCiSsdnObnnavd311suMvcalvZHp/+6ObP8RbNnqyt6Mpsz0O33X0q/TtT/N4JvmapsH0g0cbSWDZBzNSalvC1haMZUW5IfxxkbRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buBKRLtN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buBKRLtN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44c350a5b87so2960813f8f.3
        for <spacemit@lists.linux.dev>; Wed, 20 May 2026 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282387; x=1779887187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quzmPB2mAFZ3y1nGKH7QHLGF8YVjh01j8l7CgpxBccw=;
        b=buBKRLtNUbVY9iiJ9c3NqRHIqLEGFXKDkXNW/Ln/Kj4IkULhPm6mbds6P4534/Afd/
         rzFAqXQHv4tDjcsgaSCl8PP4f03cHgvuN/1yoQ7f6sJYPBVKrBCV54CKucIThhT1ZSNT
         qwFyTZtWKLODcCvl54uQBoG54OF5rutfX44qmWULTUmaoM5L8DoSNZZpQp23qAQJqlrM
         vD3231VHrNHYf040QhoPJBniLIVDguIgfLtphEoTYUMbRJg6iP5Nn4t0IXc/DND6M10/
         2mX0NFUUzZ5C7aYfUCfy7NdtamUxT93Hq+3NifTs+zvePelnNfxIljEqAHIWJnclP8rD
         tVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282387; x=1779887187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quzmPB2mAFZ3y1nGKH7QHLGF8YVjh01j8l7CgpxBccw=;
        b=p4YOgLCArR64s2FWVahT96BI3REBQjTnaj5Ooelk5yGchndTTOTYOELDR5i1fyBaih
         5aSvpelCIVJ78cjW9fmUAFGtXu6JkB1OiSuaBkZLdzpfkG8qMzVgOWczVjXB0YN3cnWw
         cWE3Qm8zKlEaBfBX1PF3MOiZ+Z6JCepX3v0Ie3CkOudmGy+3BaV6yp/J8Zhyg1msy5M2
         3XH6PF1s0Nuc+2KR7n7AIkf7SUAccI6bn4fHIfCB1dJptLpU0uF6cPDlnHFRymVMb++J
         5HKd2RrJX2KbIE1B3XjwWudK7ZG84OLxPewGuRWoeP5iMUt/sL91ilEnBs6iW/kFyttQ
         A9Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9BC5i65lQLRpggmCKqmkm112AY+zLRnEw/IOMCmAoah7AIhCpeG5e/mxTsNBqgAmi0rJJUthC1gw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yys2kuZ6IqO4MvLajFm0HNgU9tDpJLo67u4BUDE2apIg355QeX0
	K1xuB5QIVq8rU+Zogc6/hNlhloc5s4qSdMiGU9JTdWg1p6qWmbE58aTb
X-Gm-Gg: Acq92OEQl56wreRQ0/KPMHHKDP24Z28M8KsOFPtJH7i/uVACEuueb8TLZzYT5pBb8gT
	Fpz/xqrBgqsh8cIAM9QE7AMRBe5PrHHIbvoaOUfR3hizcNKXKNZJTky/AMOJg8F1fqPS3C0U5Qj
	YmQa2yt0OOmyRXwrlk1Bahs1vd8FH9nB3GNRYdzqQ/oZFiOVI0DMd3maiLg0Gmim9ZdJls0r+LE
	w4AAb0sUlRj9RYWLBw8RDvf1UwjMkLsarlcY7nvOyRPjeP5ESGagqrXHcVhqdqjj/m878lgg1yf
	U0nPa5ATOZXIhCCluauH/tzRBD5JBRz37aFrC7xX51ASkpId289oWwcim5gPiCaMCV21HsungGD
	Zlbob4VFVvQY3ozRE9686LZhXac4Jigr7pJz5LcXyVffv9KWZ1KGjZkpv3MbzQbgwYv3PGyjWuc
	Icn9kBFf6Wiz90bQyctoFOXUi63EtIht34re2oUMtqgX8Wyk/kr7V/yHqoI+A31OboyjlR
X-Received: by 2002:a05:6000:2c09:b0:45e:73b9:fdeb with SMTP id ffacd0b85a97d-45e73b9fe1amr25795817f8f.8.1779282386765;
        Wed, 20 May 2026 06:06:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-141-216.net-htp.de. [89.182.141.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm55001966f8f.32.2026.05.20.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:06:26 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Iker Pedrosa <ikerpedrosam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11] riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
Date: Wed, 20 May 2026 15:06:23 +0200
Message-ID: <20260520130624.1763487-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with internal pull-up support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Signed-off-by: Andre Heider <a.heider@gmail.com>
---

Hi,

this is just a rebase of Iker's v10 4/4 patch[0] on top of my merged
musepi-pro series[1].

[0] https://lore.kernel.org/all/20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com/
[1] https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/


 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 4aef287353cab..0d809e4ad3b1f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -19,6 +19,8 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -218,7 +220,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -384,3 +386,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.53.0

