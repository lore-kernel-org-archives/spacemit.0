Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296938F259
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261185; cv=none; b=Av4Fx5hIsCZtLhTw6BOnl0YfTK0qZrJEkFrxEfUYoVU3jsgMOhbF36K86LXTjPyUzqquDpIrKPCvP9fI6Er0A6cQ3x40ygsdMIql0+R0NIA6PyTQvND4HhO1hKGAFNOLcuWmAXm3KE54nlleT6IuSSyWFYhEteWdRkyHZEOM8dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261185; c=relaxed/simple;
	bh=9/EPlwM6vznVUXBNNDHgVNiJdTMefP764Y35mcPkq4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPOG2rauj+mIfsBTj/NdNubXTSsKZ08a1w6viTTQ97PP0h+Mamdr4tOOlhWR29fALcePwJWV/FFiXzDyMNXeftF/oXChCqkomcyw0D2i/q/DFUEV/7nnju5S1ZzNYF5os7UhgU1MmWbqJqyldOz2jCFy7nvqGpbvJ4PHx6bpG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9n4XY/z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9n4XY/z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so27299875e9.3
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261183; x=1774865983; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Zbg7NdVFVfV/LiASAwN6OwVtEgN5JVFcgTwCKtL1AE=;
        b=g9n4XY/zT67UuF/kwoFfagPBD+H+Q6wLUXRF/q+Au+NMrG/9MI3YeDhzFK9MguOV84
         sV9FwsF3xpXmnh8RYlwpM2o73p61+OSCzIeCetKkVyut0qchENkHRwflupIRDu4BOZ29
         9zb5uAIsPhyQ/ow6kJmxs5ddrcmGKSSHQ1fUpuvvsTzxII6SMeiVxJSWXgpC6feWK2iQ
         coZYERSyyfWpF1mlsi+y2er64o6luMXZTkyBKgFZ5jpKdxvOgMFsHjm902cW3JgseTDj
         L9LIr24BHJjz4s9h+7tw/b16LZMxH6LvyTTy0oBtu0d6TDjdaEglWdHPHhGN6Dos7ZGv
         so6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261183; x=1774865983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Zbg7NdVFVfV/LiASAwN6OwVtEgN5JVFcgTwCKtL1AE=;
        b=QzdqeKooTkdqs4fCGpHZbmR0r+XYZ26Xh35CH8diHI9wMn2t5lK6q2YhFzv/LaTSsF
         PlevCrOMiwHzowLpdInjp8EJLmir9aABVqo8+C+Bv02AK0qmLuFk8hFVJmCl9513FsQZ
         IyWQajruhz9nTlDsbHzWOH4QS+92AbXt8YqazyT3fo5+r5WzI3eYi8vhhEVBqNfamMvv
         7RM+dHIpydPWKSn4/5PEbV54C4QgIyj6i8lhDu8OtWXLLwDRR5+10RPqwVGpHQWtJvRR
         GDaiEQ70oPTPv3Mvh+HaVJpXWwh8tUL9M1z+28bqV2PivqRUrAicYOaKgSTdTPeSV7xd
         T5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW6UOwxSNFvTeaoaVUchk+csgV2Rftc9leX9OFAXsRGEtV7FrnX0jHcH3P6J6nD0tr2UTGq79bKkw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3d9tQn7sFgXuPk4cUBk7GXCOqonObwB3Xf743cOGPA5WcbTiv
	snW2lugKBo0jYkq58xVvPEG4vEPBnmw/qm4RG67FxiGW6CZ3lhoznR3j
X-Gm-Gg: ATEYQzw3QA6t53zk7L6AwMg+JmkRSdGoBmxMslJIU710FDHeZzbIouLDvZ+gEHJ0Vet
	Je/luIG1VLdR5eTYOv8GOF53xDpmYN41cp5ib/n2dox0bymmetu2OcRC3XTneDkE2S01wcRmjQK
	XTn/df7JkS+CLhEwZNWhpokQwfcmMoZUNwx51e73RS2N9r7eEyWwE9zxICUTwpA1lz2AaauNnbJ
	aiT5ypL3qYgSxgSaxPRZp01wGDXQE0wpIom5xX9ngI/5uvWFRLatJlANQClp6F6Z8S83YVMe9Bp
	1eqZPsH0lrLn69lXVTDdK6CyA5zGS81DhLYs17kzKmCjulc2cG2VG8WDLK0kLKSScAoju08oh8n
	kBn/CLduTZ+ASYJFDmRB59O/aHIPsOVCTGMO8HJrW91H2OeUT1qC5RBLBXzos6wfrSyfWDi88ez
	SdZyjso6QSwKS1NASUKSK09JyDDEj0VmqO4bd9n9f0WKj7mCrxv84AVt5MJft50RZT
X-Received: by 2002:a05:600c:45c7:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-486fede721amr149755185e9.5.1774261182461;
        Mon, 23 Mar 2026 03:19:42 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:41 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:10 +0100
Subject: [PATCH v4 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-7-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
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
index 404b69c47b91f8c37d74a3031dbad0d94a28d1b4..6d042f905d233bde2e29d1366bd177b41915ce4b 100644
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
@@ -369,3 +369,23 @@ hub_3_0: hub@2 {
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

