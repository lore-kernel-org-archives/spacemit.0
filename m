Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620C26F463
	for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388733; cv=none; b=UGkHC++Dnp+E4ylhkEA2CNVDAciZZaCod6ICc+EeYrsVLUTyQzwHhRwoEm+5+5EvEnD6WR0BmJiDsn5rr3AVI6MnY2p7U1Wz2xlSUsOCvnOQ1VkcgTlOZjg52uSat4+KGN7EepiL9Icdl+Z8UBhOlh/GFpENXlhZFGFUkgZUAwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388733; c=relaxed/simple;
	bh=gQgnEu46nXffeDK/T2EsMnfRsMV5amrAJvwckiMVDxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNjfCu3JKcLv7EpKHRnK+XiLnVCR6bMpkQ8w9Lf6kpdvhZ1nAc70B/WJVu7YwC88Y7hwt8/XyQNolI7EuI1eWtPalsQKbWUXOsUqkPVySXJw65qLyCFmZtenwL1zIR2uH/KLzTJRSNzCoPqRRrWXTWTCSXFa0uM3hZNqJGzqIo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YHEMArV5; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YHEMArV5"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86a052d7897so42736139f.0
        for <spacemit@lists.linux.dev>; Thu, 24 Jul 2025 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388731; x=1753993531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEiPn0cbVvyWonyoHzSQ1laMwOj6/PCdxE3K2rEb90M=;
        b=YHEMArV5OI+tcR6jpsrhYsi9FX2ZAeZSM5h71ACiuDuIw6ndnHc+JUZiWSn7r/AwmO
         g0pwyxYw5eM1plWJDakBRYgE51rAfuxAOuF6VFdJfnhD9eyXNDdmNNxHAq+wYbCD5xhL
         4SE8Wrq+VyflycFuQzXIXP8CdP4dpFfM2Ppt6U1PQLcFtJ7tDTQCVfwcr/OEr3R2TymS
         NNmDpC1y4YLp3R0w+gUJkapYEAMj6dQFA7qXvdXsG+nWtO/AFVGua9rx12z48WUhnLZi
         RmemgINcnV/mGK7lzowOhGMonpXWUz6CXf463BaI+ZURmioGhpBlEZ+rfCINUaHbRPT+
         2Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388731; x=1753993531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEiPn0cbVvyWonyoHzSQ1laMwOj6/PCdxE3K2rEb90M=;
        b=K0SIN6xyzSmw+Uzhfjfg/RqmWTVZECFbJG1j1A4yNw9v8w/z1ttJ6I5hFPKxTTnhUT
         Fyu878+BKMPBYCYUNKOx+xKnffZ+iMJyutGUJk/Qbs/1+wtM2inyRi9/Km1nuEN5FF0x
         UUPEzbZsHNi4U1VQaQbwoYbqD/TnFj+UJb4JdJxcBRRA9i3QwyESBEmNhWZjuB2zdHvZ
         jF64DSpFuQP6hrC+X1cQs9bq7BraeJZPitVZcJEMRZPlX0rYBBg43yvxs2PfdGkkuD2y
         ahUijWHu4pf3KoVitkvvaD8YC16I72GMfhWDIi2xB1uXpu8/CRJpHUV2OKC//t8OyGgP
         90fg==
X-Forwarded-Encrypted: i=1; AJvYcCULR/EoqlRg79N/tKCc0iSmTo8vpnliIwLMK91HdWveWbhHKX7CFYu8RyY/A0tmk9A/ItndZSVzDg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3qdAjoo1tlPxPbfq4ffopBeqO+NX3q44rr47mGuY14JFvC3rE
	BBxOvP24b95T7sNJ5t87gjukBkt8f6UoeSbKJEYwD6PoLmdNbeeC6ulNL96bq08vCfc=
X-Gm-Gg: ASbGncsa/oY/A4+vAtv8v3UOh7pLmfYdgrvP7TZgllam36m2Vz9zIOEHuz37S1T+3aW
	1BOMVmkzrELGnb6CdTjine9PN5s1jMGf9OnCB5wA0etkMYcudkW1oqogfOxhom9/Dpvd6Ji9/ro
	OYp6r6uqc4bDIF1ojQhs3VufTqFkpdNHDQc0T+aRz9RciC2Ns+O6dbeQ0Y+bNVFlPUQ7l0PCWx4
	+n+3UnxY9WrRNCxpOnFf/CpH54qbX3vawWnQPEYWR4/SpyhNqpF9iaKxKALsOCCSvp9fyjyB4cy
	YjNCSTXWRDowZxXRlWLNqU6rsGUvyazrsEtu98Qmibn9jdj/nENW3uWXTJ+HRjfpJTcuo0+/lw1
	TNrcKTjWaMBze7Or2XYuKWFWHrREc8MF6a8D8q5V5
X-Google-Smtp-Source: AGHT+IEOCPJEmS++a59jxbnEfzm6BGBxv4jrcgvVSaZ5cgZIE4C2TYD/gzvOZX8xyz7qYVEph48/fQ==
X-Received: by 2002:a05:6602:3421:b0:87c:4496:329d with SMTP id ca18e2360f4ac-87c64f64aafmr1508845939f.5.1753388730846;
        Thu, 24 Jul 2025 13:25:30 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:30 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] riscv: dts: spacemit: define regulator constraints
Date: Thu, 24 Jul 2025 15:25:09 -0500
Message-ID: <20250724202511.499288-9-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
2.43.0

