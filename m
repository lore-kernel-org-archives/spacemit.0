Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262543849B
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850363; cv=none; b=IPrnc9bwYddrVfZ4NMrxkcMCy8WyfV0ua0XvuBV87DPuQu33ZKTdJQtYOaF/7NqddhHi97usAz9eC6FYgV3pQO6CoDBZKVz4tXP6GdtxvQnft40m+QCL1kHaNM4RWEzBJ0LEeIgCbw3CVbKjCIQXcZrk1I7KBZAmPedhUQ+tfBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850363; c=relaxed/simple;
	bh=uQjpvvh5tM6LSZCB3GgPu4orRfOX4CYcABKTac76MX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZTaWJdJZ0Qjcj5DwzExdthgCK17yKkHIPomkhjS6hHhzRKc7gcL/wPSyvoCEc04EPBxLGCWrvD0Hps6LPVTzsiTXHMeYslyTuVf1CLs4PAyTXFaFUaxQuMQx9H6L0nKBxp4XVDoX10YXSIVB0QtFoUYh/U26ri2/bSM3LWdcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmFeONgz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmFeONgz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49558ce01afso25329075e9.1
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850360; x=1786455160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGdbltKWpfHXSCdQSqEjll17z2tSjmzRYfJiMwHBwqQ=;
        b=TmFeONgzhyOW3elxrvf9X6Dr7IlcGYzrI5fheeYtPL4CaJAb6Fs6RDYhN5xRPErDZc
         Dl8Ax8ZbArJQbcdH+VsTTvE/v2KbIhrgQM8Z+cZ5CAACSMjeMq98Q7zr9iEwRsYpxU4p
         YQN45ZMdmXt78Y1ZaduhpQqIM7QHoR0YNZcjID9kJSCsYBCsXpn6tBqBnVJ5EkXObnim
         wVjqUd/awkQANMxWKnLS19Mxlqxs9iUR4mT1FwdO24aLyUXV9yMYqQ0BLJrPMw+gTAVH
         hJGYOI25sFXQrtbrvoYUn0lf8Ahf74JkSzfFZUeU8/eP36zxOESRPjBYYp6ajsdbz66x
         fgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850360; x=1786455160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGdbltKWpfHXSCdQSqEjll17z2tSjmzRYfJiMwHBwqQ=;
        b=TVuYgJdci5f6Kzb0gs8s+9Njv+N1Zbp8R9VeYtyDGdaQOn6Q4r9Vd2gRnmGBBN8zHD
         qIMBejpl6xh5POziVZ5DEI2LQvTAnlIubHuHHA+rpDIw7SFO1iG3mLjhRBZWAOjqE8qf
         dtRkDElx3ewVOvkSEpY8ZUbj1t8aGO1ZmW+euZS7w9aheXrcFuTfZKlT2Yl8whm7D1gy
         i5s3GB720NLn8HEhYkGOHrUmTEONHack9YZz3+H+S7OQzj4zlYuMGVkP95hCTulq8xDo
         GDPI1gwXmodvZwjKg0C+ODo+4OZiuht3F6+g9/OB1ONve+/bYvKWUR6pkibOM7thWQRq
         DW/w==
X-Forwarded-Encrypted: i=1; AHgh+RqQ3sV1zY4sr8d2nCDJlnejOgaT1p5WiNKAqwJzMQklYvnIl4yxMVe/s1U047fboLFvRXpQbLuGPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHj0ZQDiKvKN6gYOwzB6Nq6WdaGxYHDACPnSSn4kWB3YFrj2vy
	civFkCHH34AMTWvbxeJIVphIWRe9wTqIzSMniunB8/8AvEzAVA2gLO0b
X-Gm-Gg: AR+sD135XwiMtTL7XDWNhN5xvYuqFfPhvkdbT6p2Om7xbdVws3Vtd2FGb8hXJU32uI3
	LoOa7feKpgqTkaCvf7NIElbqhwI3Bl6wKmlATPHyqroTNwbgvy8HFJNGvVnKQnIv0kKnMiu03s/
	dehUIf0EryU8fd1soblUTytJme6u+JBaEGvm1ykaoqZIUztkJ1wQrGW5alePvV5nAA5aRoRHVzq
	fg1SAD+2j8NHA4JIYZljajNRnO0aMEmIGlhHHCHT/ogA3Bbn4S/034gQD9OnoajFy0VMHefvyIr
	6bifX+XSEwvbxzXXwCr5HlUWwuycmqlwzoqMvaD6jde0Av9nOvqoihgNWO/NQr21/g3mZ8/9rXS
	1eKMMXinV5skGucKXnvkliaaX60Q6w6UHN+MULR4rmgubmnIcG44GoEgYft9Yc7JfeY9muoyXVI
	uVzOdS5/1RW1iiqszGY9KG6smocieXdZ5f9ugQ2Vp1x6WWO9UBPmxFXGU0aa0O0Si6xeilecwuv
	EF3zbuIm0VdZW98GA/y4TwoxN+9UT4=
X-Received: by 2002:a05:600c:154c:b0:499:4d4b:be2b with SMTP id 5b1f17b1804b1-4994d4bbe5bmr27679215e9.16.1785850359884;
        Tue, 04 Aug 2026 06:32:39 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:39 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Date: Tue,  4 Aug 2026 15:32:32 +0200
Message-ID: <20260804133236.205668-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CPU DVFS by including the OPP table and wiring the CPU nodes to the
CPU regulator supply.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 246f8f2ab62b..23f32a8a3d45 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -99,6 +100,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -178,7 +211,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

