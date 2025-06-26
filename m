Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA42E975F
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947524; cv=none; b=aDyY7RfZQx7f4XTFs5gZ5S1gzPbc5hmmEuq/saJUTDjjxnxS3IGjzWCEaFCuLL36nJQYtTy/r23rJr0vh8BuuRhKrj9nLw6OByyRLOBEQ0mU6s10QRPpNVJITIcX03VUjTIryIVhjLtYmNwV8+/PFUXKCRkyohM0UtcQN7VA+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947524; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMkRHJ83P54qd5rbyBptVy6cmC//9ebBLiEFuaQzF7ouJg12QsMIhtkqAxEgouDRXq1ZdhGqqiv6KbmUmo50DjOmDN0YzgsZv/+QtDsYanayXtGbgLfe1fCg/uSqrZhoDhaYsOelYIH+VLFbtw0UnMoRXzADDzKN+aIUCUV66pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2YP1BUAC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2YP1BUAC"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a58ebece05so10981191cf.1
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947521; x=1751552321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=2YP1BUACEIi1UHW6/Mr76fu65UiYzWjXf9i1f1tMijMI0lR/6SBmi+ue/27PighefE
         BXc060jON/oNjLLsiRF2YkgRH7y4FtACi49v6y1lV7z9OVFbL2C1lvjcTMzacVnjgoQe
         LsPV+0ORyRnuJl9ZBGLs5+ZUX5EsOocTg0hUruTivLFz99l96+iivYHvdyP72jznXeAW
         3uFwaE2FINVUhkm61IOFbn11UIVKauZ/+2BZdthE3vkxQXt6JxokIh1fH86kmldoAJZi
         qo9VLzpnDC2PgtHgqVHl/+v1IE9mQoQHUDJEN9fGSyw6MDqdY22PwzNK8rjw0p7Nj+iM
         fdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947521; x=1751552321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=DSfDbwhLlUZ1J51ZWg75VYmPJyjdE8DvmD7Owu9QYlmV8A2aybtkjQYcsiv0YkTrUe
         JAiFYuX0GfFgu6459f+iXJ+tGteaQipsVOubViY0m/QMDpmOU0CsZ9+6dnnMTxK2kIwS
         iHMG8Np124qCF/LmfSIVlLMyL6y4M4wGDifcIeGQrsfw/dKPGA4TCFrbLQXiCRRoqf2u
         Mv1Xcn9oXCb+Iwa10fbYvVIVFz/BCHWjZ0+kgega55NukHiKYjUH0hZUkZI8/afVcFy5
         cQLRQKz4wUTyT3uLSwODkCBU5FHfDXuFpg6CdeK8L9cJ30/Zld1bER+MBSPaHHLULgs6
         98dA==
X-Forwarded-Encrypted: i=1; AJvYcCW/elqOCXC3kv6XLv49PKIlFkbmfAEDzCWi3RlF8nhu1wkjlnzynJXo27xD8J2KtLXj78k4Yp4TYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMOkB54TLpdFyMzAWd6IqX9ZJQfeKEsp7g+thrkyvAvO/C9dfb
	EP8po3ave2bgD0ZvqLnMU1EiUN3igo05vixUJ/JV0NUgopVcZYubC62A8pCXM+yhBdQ=
X-Gm-Gg: ASbGncsNeK5lkpSu2Kig1L8iam1qri9nv63zE2WFVKsRAKWUeLlJpeoU6INladaOfx4
	O6vYtdkQp4GMhih8yJt+sJLvVQ+Z0VF6wf2rOLTNBHV1KJhSK4sixaHuFPLNc1MTzuj9Wr6xTyU
	qbEkiateACub1DRQ3vJeTkqIGdcW5V+0HVlAzL0WstDSzshydQcijoUGS1syNxbRWdE0g3dLalq
	a/3fbowAHILQOHhGSOe2Cke4TXA8ggFEzsXupTuXU9tvCgDCDldR+fAM60aQ6eEP6nZcPbC8VfQ
	XT89mv38GLGFe/ju8lP9WcQECKdluZ7C6acsb2n66ilaWZ23Rt45Z5Zty1EAvtRwJds0RbShco4
	+AqYhJtamcPyOy7vgBWsEhykx5msJaJHAOgc=
X-Google-Smtp-Source: AGHT+IHsx3U02C9l97yXNhErNtXWuqZBL2Ji63UbeBAH3WQ3eJzVVCOgX1IG2CL+5mxLNXJrr6vN/A==
X-Received: by 2002:a05:622a:13cb:b0:494:7a16:18e3 with SMTP id d75a77b69052e-4a7c07ca74cmr99997701cf.29.1750947521231;
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] riscv: dts: spacemit: define fixed regulators
Date: Thu, 26 Jun 2025 09:18:25 -0500
Message-ID: <20250626141827.1140403-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

