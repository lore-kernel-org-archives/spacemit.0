Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E378C28C00D
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341126; cv=none; b=Y2gARDgguKMebrKozaZ4fSJ3RFJpwJ+CtnoZUWEyne/URCCZidl+kxOrKjquG2Ra6tEHelfXmzJ0neOMP9KlO/lD53jYU+3dT6thZuP6ehIBVYyu+GMkQzBVODkEGI9zHdZRdOk7VSmMpYLin42FtsZVc+K5ZtmXZdxgKnRSZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341126; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXelymK1m6CCqWsZ1jjBvag+i1tyjiBGA5KQbU7bS1UseyZeQjnmVzNjQLsRmBETYKXrWo/mogzlAjulj6eExC9tQgTuA7UtbW6dGF68S++AImy+UKPT19P7vyaMCHmEKxW2LKxiDmBy8pd0rXsTBbkp5e+UvEBshhqJxQQcZfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XVwWJJRH; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XVwWJJRH"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3ddb4a7ac19so2263655ab.3
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341123; x=1750945923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=XVwWJJRHQXluBoRtYvik6JwrrnQgvoukzgPSZu0v1/pNASbKptjEFUWwoml/rsJfqQ
         wsnwFTLXR2cFoATQut/bZThzfAOkFXvrR/ivZNqIT+ows/m8gs0XAm0H8YSNBCi7A6kC
         NfI2lDodivwfaF5mV9A5YS6ySShpe+5nHt0zCw7yo1SfGveeFREpuElVKc3A/StTT62y
         W84qXeK8k429igXzDjZygU13xefIVCiIctZ03Uzq9Ib2hkqSISoC4WoG5WlJJSh6jvKQ
         bUH/SlKnQPZpvHJA6FJQvjbgYTNswasE9HevF93WYvGYc677N3lL3bsn3rL6HIpInTEC
         k16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341123; x=1750945923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=wANlpabhMFq/Q9sALbJLM5opiSEd1Wm5hglzP1SZLHXWNUWVb06vHB5Wam3ocN7f4L
         ms4/q4rDzVuounxt6PAQ6VSnB70DtlFXB1Ebt4YMDKSWR2WXd9fJDSXdKQBBqhugXS/X
         ndG/4oBYmxqAQd1ux+HBcG+Mxa4yjKDrVnJ6dr8B4e2I1aeXU4XQmJLjCtI1rgTe9EJq
         cVVvaW4BykKEvHzwyFCRlN5+LdaXM64mcy39J0Af7m1bNEDADmxOFMvfL/XCrMLe8uaR
         HjYbyglfjSMVs4a7K+flml9U6oUv8mZI6qSKL9q4vYrfW6P8m5oOoPn3sI0/ZwhEnXC0
         ybgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmwHX6z1l+9KKZEwqsSASNL/QMcmHM8E/mS8ps30VrdkjpAJplcJjJLckufCLjXWfPqRBcQpacbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7BmGtlolDJ574X14piRz948NIhnupRB556q6dkGv3mpWWSyOy
	5TvTq8hErL5IZzw+LGfvU9VawTh6S7+PEKXJlkyntFZLGUycDHmJOxRvJpM5E9hb22s=
X-Gm-Gg: ASbGncskTwjSYS7XxuHxwf0WHje52T+Ll3yVpzI/ABu6Mvw0+asoBS9y/MbmGaki0DQ
	kfJXxLJ2z/fXC6z7MHJmqnrLQj3VrrJX8wEiwpZ3YdrWT+RrCxiUK2Z+CpmTbvaF5yGohrdGpBr
	HK/kZabYH6fmdx90+SC5JRJ2uO5exrXPncHNlhWpG7JDpopiC9xiXHlaMPW77DtzCFGQK3Fhp8f
	qfmv+p/8u4J5kEGqIwnt1Czram/Gdgni7p+ML4kWbneEX/igtzn4iOs3wu7LrteUUc9fDlc5YJL
	nhHrPsOSc3GZvGRo0ntw4v8bhmEJ777U1VutaHlJl4hplPrY1itYCjy8XrDJtd7aACWmNfyHc0O
	2Xfc+2zDU8xgfyf7sELi2c1XY/yk8kY1ceth3+2FSug==
X-Google-Smtp-Source: AGHT+IExem0l4ezDbiC0YunjYTLQzP9AWFOBkBc8gw8zgbBmASiZICSB36WYhCAntpWfGoVKA6+PlQ==
X-Received: by 2002:a05:6e02:1a8a:b0:3dd:ebb4:bcd8 with SMTP id e9e14a558f8ab-3de07c5cc98mr247003285ab.9.1750341122994;
        Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] riscv: dts: spacemit: define regulator constraints
Date: Thu, 19 Jun 2025 08:51:50 -0500
Message-ID: <20250619135151.3206258-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
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

