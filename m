Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40114B06C
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562998; cv=none; b=rugMygoKyuOEyMw6oeqehnZ+4L8rwJNut17bscyii5lB1ccAF2GDkh8RsUupC5wgUDud8KaNNxslnWHRmRe6Ti4tAQH/IW+qqH5O3uHTqHqKyp9fpqpya+2OxMfODdtm6ZHQTd33NcKVxGh3+WOThEjIRF9tK4iA1TjKTAa4wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562998; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdFRleVgj86MVdJwq7mj4QO1MNmWAriaVqbzmhIQinMlAMHe9FgWFOajvowGUTAPUJU63whcJskXTrqW0q+8T38qumQUli56YbWHn3UpoAHl3POW+1yqcWrh5AZehFva464Ugi9YALLEBwtAbzQ2fKW4SvXyODw9Oigh+CJiv7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=aegys52Z; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="aegys52Z"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a43afb04a7so22028501cf.0
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562995; x=1751167795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=aegys52ZkdIFQ+hsfEFQMp81A8U8xoiFaKdJsSgiQFfY+I7nEapa121OIjRzy7iXus
         JUlUgDOV/cg568k+eMwUxOuNo5ruLSkBcT3MYyWFuMngJJKy3H9e41i1XZNHdt60dNI3
         EM6jZv2En4wsRAbyz/v/Yrm/iu3/2WczpCvl0NfGED9cBa6SuMzNvst6wM3lVfLbAr2w
         WRz5s7qZnMG+T7XzX3a481i+ymJhnDDcIp66jwX0Oo+HvmfUDqCLtg24XlP2V3d+6otR
         5hISsXI8dnC/oIqui6bQGhdQdwiNuRl7eNLmsv7SgzRLiIjBHDE/IkWRWIkEmd97oepk
         IXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562995; x=1751167795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=suCgtf3/qT305FDpCBysMCd6WpJf5ORjsvCjsV2EMwwMUNxtE2Kwl8XAK7QfRfiBIg
         dKprpU+NN/UoOsSFGRLJYgBykdiHZggU0BHe+W4JOqIdQ3MqGPYpr/rTyygjUfH+0Rgu
         U5QmWDfgutkIgWef1Vf3jOndCL+2aFYlWtdtkw8V2YxdT+h7NamiuKS+0c6m14VGHPvE
         EzSqVPIH0foNwzN13wDFaMS/W3ZtdLTRsk6AHhkHFAECmuQZyuYDdImNRQlq5A86eV70
         h5BPSZnruzlQNFWf/aaPXgUFZXHbWNKZ1kHdtyAmpIz4yyc8afvLo4mS3403grbEhB+e
         s/vw==
X-Forwarded-Encrypted: i=1; AJvYcCUGtfoQl9cbmB3bkUx0CyPYPrVWqatUGCgX6WDrwUwy2O7gXuzowHb0frRaZHYQFVQC4CWfsEq2lA==@lists.linux.dev
X-Gm-Message-State: AOJu0YySAXOr5Ur5QkCUVmw9d0OPsmNHUMSyjXX7R7KDdQEBIFlCZMWC
	PxHYTNLXqA9E2Qk1wxkF6EZnazUHtbf4vakyTUn0joYEGzC6oiH1dkvfEm2P++DWaDw=
X-Gm-Gg: ASbGncu3BAC9MaGV+vYuEXC2vqPRS6cYxs1HRK+ZaKWuqpX3S3mLciJ2I6EwI1iixRH
	j0GJv4V0yWbnnxWUuNsqJevA6p0/oPimT+t12S5hQCD5bP5KQD4nidMf6LMXzLp8j8UjaOWg1F5
	b8PTcqFR0o62RkxGKFV1UswkoJr0ghT60Q+7jQViAsve7lcGIu6/bCdX8zDOy3T0SV9CWTNX7fo
	O+c2AhT+xz0XERMoSWt8dvkeTmNrQtCXNSaq/DCGOBI99We/DlexvqbEQiWl6kYVYeSmzRDKLi2
	EwBnCjLms6eREDIS999oKrUgRyn6L3M0Fpxr/eIGUyaqMGKPUKcTQeUOpRBkVs4iexRFCbAJBPC
	CKI9uk4t+RgtEVn3ofTIGlZ0unfyWy/o0XkRCJtVBj3IZSg==
X-Google-Smtp-Source: AGHT+IECbHxini7Bpk4pSil8XqWCldpFqGPbjiNx6S6FZjM9RIZ/M0w9L9+hwhK6KfptNTvkIzyZsA==
X-Received: by 2002:a05:6214:1c4d:b0:6fb:16a:da41 with SMTP id 6a1803df08f44-6fd0a31cd2fmr142653846d6.0.1750562995562;
        Sat, 21 Jun 2025 20:29:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 7/7] riscv: dts: spacemit: define regulator constraints
Date: Sat, 21 Jun 2025 22:29:39 -0500
Message-ID: <20250622032941.3768912-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2

