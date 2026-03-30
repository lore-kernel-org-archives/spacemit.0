Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C933B47E0
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859921; cv=none; b=aj/tbND43G5DbzQE2mOODupMEeEU4+y5CyOJo/VBjrvRL8AmIIkCg4LX39UGbjKpselJuwLgU8LaMCZxMwioNtROBdZhM4M9xIgHPNXNrJA0HujOlvdjRE9GSy7+NcH9DHcRclchpxShd9/dwp/Xnlclbf/JVwDFHA/94zRBGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859921; c=relaxed/simple;
	bh=k3WQFpTj3xaaEoiZ9UoAc/GeyanLbBgvNpL3Q2ubkLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz+rEDiLCkXTm5Oaeazdy6ZpnpseNl7tJx18bUKYg+QH4/mx8jURpVitWI7e/rWC9d0obrQ9Gm8lCbFNncQKdKC2Xzg03c9dsFPWjeoWZeSqjXUElJR4snYCN8oFQWUPHx4O/VfXo4pX8Jnv/3kFrKTJUw/6HyV1ZUMUNjlh80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC2L5ifd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC2L5ifd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso35465805e9.1
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859917; x=1775464717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWssdxlHALW3Qgq+7Nkzy7T5aM2eq9AsrkcjeZdUOek=;
        b=lC2L5ifdY2VXSP4Cd6HzN3qZUDbqqON/wqye08CLanqvn2Iar6lqjANt6V4zKZ+B+4
         zsfMJvznyI4QgE9rPtrEzeZ4u7XArrt81zXU8773N99vgdD4Y1apb1jZBg2ejupw0Ei8
         uKcdtrvsmPrGDGcInjV4nu5L0JWVDgVakSr62X8LkwsO0OmC0CJrKhziWP1iYw9/DbDu
         9TpOihWx279ZvVbai8f6iVYRy0WBk0EsHNarSuumPFu7Em1Qa35VX3Bwya5aljicIvT/
         7v7/RtpkzV9X18Xyl5fZKEjFUu5RLI+aAN00oyUaQ0LfBnKvOtoW1TGhwZD8GspKzsvt
         vlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859917; x=1775464717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWssdxlHALW3Qgq+7Nkzy7T5aM2eq9AsrkcjeZdUOek=;
        b=Vc2IAEr3hA8Sw5VHHvlKdWmJ3TGW+FfWjoBRMY3TPJdLBSstwq3J0KN+Su3VgHwm/p
         uGgS+0HeOQBQqCnC7dtbOGLV8oktL4P3tiprK/AMM6pum+cQMxMw0YMG+qbx0LzLqnL1
         XmGGai2m2J6ailSfrHhXlx+d9S4Q9qz8kHMn7yMOQCkkTpUNbQwOeR0lGpCAzyn6kVos
         IDfrEMidjs47ANP5c1nWaFay43AhDZ7uVFSmTA0NKTZRaMDxaluwAP/8WwBtUq5ACVIS
         UknZ4RDDzNCAaY5rJKnL7YqMy3F3P4HLnfkUCUHgo4XKlJec1bHgdgHWJRjq863VxPWf
         Ewvw==
X-Forwarded-Encrypted: i=1; AJvYcCWLM8T4l2C6uS9I3kMhekc853sP09qxG6kVYaPWrZl9BGifpwyvN5USNugFM96xN2edOX0Jfd4YZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgt3beRQZPpUu/SILFcZIQBt2bbIlD7PEcO66o7Y7/ZuV3+HNt
	UsNt0i04YUMgD2lwf6Jh4LM6GIIt8POoYNRSBjXI5TzlX+anWwJd0V5z
X-Gm-Gg: ATEYQzwM/IE7HsPY+gM3DmDYgfKljUAK7MvZwvViIGZE8w401WigK93rq7vXsFkYbc9
	SEFwjQ7nWx0/x3LPgO3n8dnWDnIUKIu2fCgGbHO8TdEkrz2RE46RW7CjW+heiLYP44baSYcldIp
	8LhtCIk3AxSAoIBmGjZmp/1y3SV2XObt4lS/MkntKD2oKOXe4yInHfpdDgQjE2btz7wXy682oPZ
	Wf5tn2xd34lAa6fe7O+YIDeSjQF6t+mS7gZR+akSUArMzlYtuecsl5UJ51zaa8NZFDj9SubbmhT
	CcOCzWW0iiX/sgS3SV7+G0zO2f5mCzorgN0mduWsmsyuiIHTHKXIS+5O7oPIaEpywQxAyz64Hu6
	8SIGYgGzystHmlniipTL6frKe0bzcCksfiZ513R/b5MVbDvuxN0yWKC7mXBrinAlaoIlQ6BlQKh
	sorbkDcans0cN/YylaXfoc+OqKJeff4DCotlMNH0U3HMk0lKnewGv9Q4B4QLb5tNlvK53Wlwi3b
	90=
X-Received: by 2002:a05:600c:4f91:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48727eda549mr197940965e9.17.1774859917344;
        Mon, 30 Mar 2026 01:38:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:09 +0200
Subject: [PATCH v5 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-8-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db350c8f53aa0f314183b3173fd76..a5bd63976a4ff772ae9a9f983042e9b032ecff95 100644
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
+	pinctrl-names = "default", "state_uhs";
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

