Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2D39C65C
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669884; cv=none; b=CeNuq9b/zh/WaYVhUXEdGKaJ99G/u/44zI0V/dKLeaE0z+JrOj7aGlSqnvrrgCb0AHgUoTcdpknL3M9J3Pg3xkZhNdtMwtvupazDcYZMe1t1jyZhHUxw2L75FT7FUCJQkAjhwPYZxclDvzq3RphQAk+J0ey5Wts1NmFb3aTHIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669884; c=relaxed/simple;
	bh=fx2qLZcY5f16CxHdcoO1htYJobmi8onTWzwMAk9DhnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkgFt3wwcCN/OyUF3C6jk3rrH+xd85NLLxNAa5L8rUc6hs3ljaWD+V2AKZdOaXULpsyvuNXvokpePfvdr7nuNo1HCsTfeF6gBDYBncca4gvzE1d4e5COrUeRQotFTFOGNq2qtXCF7CSeeCczXj6Q1ribnjrhm6CK6iQX2SLAPBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA5W6fBw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA5W6fBw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bcec8613so3505793f8f.3
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669881; x=1774274681; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGku/l9FNPrwiqABN5hj0gv51qaKMC4DWzEN52XfCG0=;
        b=dA5W6fBwbUFIFpjhj+b5UWsS0CaYyOhx3uNIMII+JKl+oIG1uhi0RspR8JU54630u8
         C3yZt+yb7S1ZilH4GKsDfMw9CGnzrC8cyH+LmVMUEvDI8YOKxbcmuMtcMLO+PiXLJf2A
         z8yTFrWj16/yW54Itk58UjJhOtnYE4ciiUGNY9uqquFO0XM4xXPwRcIEpzOGERguNh9n
         XaZpBXj0uEgcqk/KlIlkdzE1llklqR2byimUs3uTVfkEx3It0jFvsP1RaaEmu6NplkGs
         Ld+nvPkiQVVmmxj5QCSp4fw1wxxsblQxxOijdo09gGb/76Utd3dG6vbVuhQGNOi7JLWS
         fYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669881; x=1774274681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TGku/l9FNPrwiqABN5hj0gv51qaKMC4DWzEN52XfCG0=;
        b=j0CJz4ANhizEArPw9/Ji2VE5i40vi+BSIX97PnasGS1n7Z4bQWSo4KkeRDohCdVq6h
         6Bh+j0uCigjuE2rkVdIMzcLWxqL0VUQbU2jthmVXlGIsLd95Jd9NHKZBwikXg5qHGJhQ
         m6Z3uipKckM0AKcy12WX7Y98Qip6oLG2jtZpJbxy+SZRW7NHrtq4kmZSv6D4v2cIqaAn
         XbmZ2IgMAFBUFkB78t5chUdMb7Fmjtwy0nZWLKef0UUOzsCRwFKUmbaVN4MRX/FjkXDT
         LNAe1b3QQHyZHq4J6Z78aKvBlRP05ufQMFW7mpvfEBe5lB/gv017xA75YYN0gehyBlTq
         IaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaqGqMlxlxLbmQrG/QgmuUXosZ/rnE2b9Iag92+1BS2rokbd/cPswi0MtLa3/NDjSiiA+IRiCvJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQeFRfXYXtqR44zhbhVFB7+jO0WuwVjzEiUPDalzHltDnMPM3K
	FULAZipi8atkn9XesBC/n66OfUvcTCnBd4HM3OEl1kmI4LRtIo5ZQ9rY
X-Gm-Gg: ATEYQzw2aN5xrvS2nXj/YYSMtXD/wnEwzjUenZFt4RZrxV/9VNv0UjkcyXZhz1RK80a
	PP62+ZgK3VktZKEEcQC73KZJ0j7O30+/sG8CSpYJ6HZh6R7XtRn+gmH6kMTqIC/UprHpKOL8rw5
	NL9mu/0wW6AXj8CKgZj52RBfcC+EM67z0PVXCijAfdIroc/jy+kBO2MRjgQFzS8YL7tkKCzoERd
	dQ/sjnJQw0uM7SlyUxhu2BPGYs1kV4hcpNU49CenjCoJ8r0MJxOQG/vjeimnRA1g8mi3SkEWvxc
	lkQboy5Jfx8BSULapyFYRcJ6Fdr0WtwX0N06C68YuFK/A+B6Utw3ofstWLCmhkv0ym74drPAbkJ
	Lld3oUPYP91Iy+n/P4KJwAhRi5QUl/vqEj7EcXvEWWSU1Sa8AjXGY2ZcR5qX38WSENRjNonCN/f
	/u19WUBf9wWE2mUdYmmCLXpnNRH4kL8oPqjLy4zSvZ/vtGN7DuytRBS/5Pesc85Lwi
X-Received: by 2002:a05:6000:2889:b0:43b:4153:c2a6 with SMTP id ffacd0b85a97d-43b4153c45fmr7601207f8f.36.1773669880512;
        Mon, 16 Mar 2026 07:04:40 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:35 +0100
Subject: [PATCH v3 7/7] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-orangepi-sd-card-uhs-v3-7-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
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
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 404b69c47b91f8c37d74a3031dbad0d94a28d1b4..a7d480d01ccc0439dbf456ed5a81f467af68056a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -222,7 +222,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -243,7 +243,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -369,3 +369,22 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
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

