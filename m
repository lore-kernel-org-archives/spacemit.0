Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1011DF271
	for <spacemit@lists.linux.dev>; Sun,  3 Aug 2025 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189910; cv=none; b=CqstxWdBd0xLeG9I6kG6NLxRjuU56MTfpjqd9M4HxMMcp8sMip6ByYgYgA/PTQMSNZjoa7d3x0keGahOS7mMPgrHn/2JLPuJqzhMRA2bcwNzZl6xUY1lc4/0mWQCFKSbi2rYeWlAWyyd4ajWKqSk/ebfPop1RzOLvowjs6NnMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189910; c=relaxed/simple;
	bh=4MkO0yPVEXokF7BKWo63wkxjH8l6ox9Iw2xywkWl/sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBf9VJttuU/DSZojROSpN5x5LzQbuBc7cd4H+18kZfFnl/4s/gSzDsYbUjSVfJWz4pJnhBgmr+AVOd5517L0aCwvv1qb+J7EWC2e0VzZD7frGii7jZ0ZMlHVSOTItmWrJIMp+2n8mUamUPnWaw/1gGbK0HXWH99QLsFgFSTSwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eKDCOey4; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eKDCOey4"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3e3f1e69090so8124515ab.0
        for <spacemit@lists.linux.dev>; Sat, 02 Aug 2025 19:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189908; x=1754794708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=eKDCOey4eKU5GO9b7naP3yh4AEi3DPq7ai4njE3AORiGVSc1wagQnyQPsNCohlmgI7
         tL9NePgWsB/tZcskkpVCjpCF5PklBT6VtSzyV7bQ1VAXFPelHhjtz+EMI+W45A8XcjjI
         3krTep6ZhfRosYhFksPopbis/aNK3xF+n7F0hrM4JOKhaCShGKn+lnmfFjvia0jc3riy
         yWCtmRQKyb1kCfpftbjw33ONYzZ9DbOvimSB+6mUJpozdRpShrxxEGXWNSB1E/Obl+tO
         B5/1wzlqlzPBx4sFkzowBGxBVxaS6gVMGsQ5Yp4qkcziN6jPxRkZqullFYvfvgAM7i87
         QeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189908; x=1754794708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=Ra6s0cgzJQlqb6IP1QDZZwZgkrNKLp85755KPOFmFP0ujpTxYOrcL3JESCHD0ORT/w
         e3KKqwKktw+dA0HWsbOgUnuTPcr6pb0KLEzuF5oNjPTANbPgkq54Z75uQ0G4oIoJ9jiI
         2YiFUqGVlD9DpyJucS9xzXhcF7JuF8Ul2k0UQ/gNBwQKISuw0y43deSltXIDvTDmM9Do
         IN4aNYRJaw2gbhZiT8QT87DCgZr7CIElMtGKEWulDLMwubkEipykd12z3P9wNsyh4RvJ
         8WfYNl7kyYdExt3BL9afRIYS2qTeKLupI7T1YbEeObwgBrx+MxUkJeBVm7DsjXP+/Yq1
         NNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlGdswe/TF4I/xmQRhxIkGAsgHXTpLDWNTaffvPuGySPpkOtXB1Fq7oZOHdnCfZE2prLQb8OArFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdQ445qFHj/gysulzYHodjg0Iqhpdb8tc/gftImwP8W8kdlbnc
	iZUKT2q+EfXaVsFULuP6DaTDoWb0XLg/zVwiDPd4t6+pdpZnnwO+oEyZsNhLZz2EeSI=
X-Gm-Gg: ASbGncvpKbIYFIU1/X6us0qM2JZc0zCIl/Ew+gNb26WnHVoPQNWDbCWuCNiqBgBSLLv
	Ajx0E1VMgIQr3Vta6cpAfRo7T/OJX4/1VW++DLEV/HPyotrEtYPoI7uVfiB68xMNe0kpCBN1HZG
	6v7q0g1VP1zeX/RCmjiI0rUbDF6O5cZ3egFffknlhBEbK6QdWw1noXdosDjssOnc/a9/kcV+DCF
	T1okUjTMH/XynUT7uPhnnt45mi3XUpEl50hBPi9/d3+Z574Lq+Rd8qj4kXX5eYeOAJHeIDOiJ3k
	fI7IQ+pXkXYbvO4MgJdbU5Kn9Ji3YeBnRPe4ZCfh/XFi0YMCuc00NT1M4sCiRP5VIp7xytnx1RF
	N+2arCylGH0yrA+w9p2ixT5zVBthIzUv9uTwYVOZaYCnDO3loorgOB5PPDgNY0wAefQ==
X-Google-Smtp-Source: AGHT+IFa00F5/dr/4CJjlueOFIA5pV3OJea5UsZuFhaXiwjw86cfQMhRrHQfFtqyDPs6JBYJR5sLdg==
X-Received: by 2002:a05:6e02:b:b0:3e2:aafc:a7f with SMTP id e9e14a558f8ab-3e416122d83mr105791125ab.7.1754189908398;
        Sat, 02 Aug 2025 19:58:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:27 -0700 (PDT)
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
Subject: [PATCH v11 6/7] riscv: dts: spacemit: define fixed regulators
Date: Sat,  2 Aug 2025 21:58:10 -0500
Message-ID: <20250803025812.373029-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
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
index ae9409fe398b2..a11a60b9f369b 100644
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
2.48.1

