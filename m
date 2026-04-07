Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443373A7832
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550377; cv=none; b=iniZkBJzbfhBcgEPXJM7+a+m8S8GJKqqZu2PcIEQJw9GrM9Y/3d4fyB4/AGM/9GJE0fTokI5jX46S2I6bv0Yc3z0GfmMa9wI8h3HVUC8hxM4Am7eGRjB7WCw11ppnvitKScQ2rWOsxyZSHkUJB7CfNGLeAg7bUSarvUgjFXmbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550377; c=relaxed/simple;
	bh=P60e433P/IRmmrRLLAQOHXv5D73fLkqt9Yaf5YISuyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIZCzZuisEN3u8CxuTRDoWlcFsE4+rwHZ6YxybTRULRB+7OTJuBwUb3KhvJjoD2Hm8HNoKOY74bGn2I3FqkrN3nG/jbSCRtZ8aTm559FPry5IeU68lR9ndcRultTKDsH0y7qPR3NQSTPntk/eLjkAwetvB4hfhD+Fmk6n1+rYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ86iG1z; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ86iG1z"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfbd17589so3671021f8f.0
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550375; x=1776155175; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+BJYlYfkNO3bzgJIrrKwScy12NnJdvPgI8y4TWtzcM=;
        b=CZ86iG1zUm8+tkImcLeexf+B4fQJ2FcGw9g0OYloRu1yoL8d3ERfUZrDyyXZwulhUX
         QO5t9Qlvo5iIyKRj8EbkYvWj9q/KVOgwQeq6JEAG7f1vXJqQEEZeutb0QS/oZ5EQxzOX
         Y5efPqvY7RlZMvM5zpOc7lbAfuZMG4NAIk6E00586SVunnIWrleASBiqhx8fy2CJDhX5
         QzVtCeH/YQhUMY781AKSHODg97OS95ezrem/WQ93UwGI0aPirXGUCOibZECFsZ88j2Wi
         ucCPnLoKhJfVk+AyDSqYHnsm8wpXq9dio+HUme6gD99Qpf7EMtFsW4CWVYMEA1dGuh7W
         6w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550375; x=1776155175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W+BJYlYfkNO3bzgJIrrKwScy12NnJdvPgI8y4TWtzcM=;
        b=jtvsO/WdoSMJMly21DBe5lyODYWFSx7T4Lm4dNzIq3Y49IvvVvReMjR1hGdYBuzxEE
         /TbQAZWvhI08DuX2nvh7Kq/zN+wf27S8E68VAHbA+nHpI1UXrUcoPP1suyXZUrBNn6fN
         f5yUGHlGo2xm0Hh3feSuFTtH5AE8pisLBb+113AZhiEES+lWueXHMHFd8JAQUA0o4hoe
         Ya08VwAZmrCjAghX096MeXyrpePq/dNMO6zu2bz42YYdXnIOQDWR5DSqEHSINB7DBaqp
         M+mpcH5J13jnQDNGnOguazeY30y3c1Fva755Z01ThfQ8XO2xFXXqlNX/boeuGufFv2u/
         Gu7w==
X-Forwarded-Encrypted: i=1; AJvYcCXmvSTkQQWPMGLVW4eFuLn1oanQS3TnpWWzCyqeug9m7qIcq5r54AzSzIeu0qfdh4Ux5CqnN8DqMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8cM8fwCzyfZRGOYPa+LFaNSMaLxMofuyTvsY6zM2gT2+aovl+
	Vb5htkXjnSt6KxcGLaemenAsufuPcCP1q+v1Ss2vaKjY5vJaz1hottvd
X-Gm-Gg: AeBDievMy4SEgnuH8HoSQWaqvAFJA7tErgeY+rafWwfrycKH+95g/GyrLOD2y2wX5LV
	sN/+gB+LaKEpk5WigVV/CMUa2pmnPrOprMnO+UcYrOCDoosogT5OURLStAMU8sSBLoSpZmCKISH
	NDeNaBu3ETzrcMhZyFkJpI+2i8H0u9wu8qMMb3HCM2z7QIvbFHxExvFtgxVwiJ7Ww2HHbvgi2VG
	ZXP9b4hrGRLjzpsIgrwGGQ/EBmpo0ScqtxOlRiF89g7lALACuJG8wrezryX6VzR4xUPrX368EEg
	geFB3i07Y7N8QrmMZkaqXzUIW+d5hW6ztQIxxbt9DcNoUVuXPBaHwEzy8Xx3wPjuUDCTV3kZ68I
	eO+uyBxrwWXKJldcwl+Pwn3R5BpCcY92cUaDFqZbjOSnMjhT7xWS2VLx6mKYdiGCPtMt3WXx8lp
	CW5IwJze3HibCRh8ZtIwMFM+XQEePV3VTmAVhS5kau4Ys54aGnrVzLpHZjtjshB6gu
X-Received: by 2002:a05:6000:1883:b0:439:f605:afde with SMTP id ffacd0b85a97d-43d29314e93mr22324658f8f.51.1775550374535;
        Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:28 +0200
Subject: [PATCH v6 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-8-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db350c8f53aa0f314183b3173fd76..a7d88564630f3332270ba5fe47b078bb14f564e5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -220,7 +220,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -241,7 +241,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -367,3 +367,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

