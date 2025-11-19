Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C9340A7A
	for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553414; cv=none; b=EtOLgli1MfsExxwO60nm0mxEImcgbJ794H4dBmuwGeu2BcKu+mAMgYqjtumlleGKohoIxzZo0bFESh7yDdM+Z1582GuzRq4eVKhVska/cQ8gOsP4YhU9cZctlazXQN5QpjgoJvvwW/+cdZo4YveZVw0NrpVNiqUfwZvQ8JIzx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553414; c=relaxed/simple;
	bh=7CjOcGFE5wwSmpZcmbYOnGQ6AQrPba6RbTKMsYumG8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiT7F7rEgrQ7Ln+7DCNgA7aViJLG0tOLu6kkIl3NT0JLG4J3OLlmB/FT3XApnpVO6kAiFJtjS4/WAyf+PsJP+/PPqW2PpAdi7Wsczzu3UvJ0M288J+DSlO5VdYfxJS0wuAf1k2MrkMAzCsAzMqUBfUa2LasUZGEdq8paPB9UtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAKLSxCu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAKLSxCu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297dc3e299bso64641385ad.1
        for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553412; x=1764158212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUwM6pAblxmgyjxDQA/gZ64zf5hkh6yLTKnpJtNXTew=;
        b=XAKLSxCuy33N2/ecnOrcIZPr+d/SnBQBz95jQ7eddW0h9/donjzNR/c8s068QGVJ/M
         cKuFGLhXGlUu/kBMWAbHpK51rU0xSDVYhfW2dbH0OCYwAoyf2GnY8Ne6gdDSSRBg/LGp
         EHfx/samfwfKxORwhUyek/pA6CSdNKiHNTaASA+WNyXgCRxxaf4giQJxjFK9DjbemA/n
         +W7Nj9oSkaRwi9qieKFqZy8YJ7ffLLkkb0DVXqW/whnmt046p8jZOm+6ZQ5w8DRWuOQ8
         SLEcyrG+AziBPC1B8M1XSMHYxAdVCvBFhT248rOAeR7/yvP9TvOGTq2Afp/O9J/e9AY2
         dxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553412; x=1764158212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUwM6pAblxmgyjxDQA/gZ64zf5hkh6yLTKnpJtNXTew=;
        b=gQKFPV8jbYylQNc+kle4cVawAu78EK6SpFd0qRVS4NvVI4pmjxL2il0nSRHQ12Ec+G
         y0yzXpw/LuMrWxnAZhL5EeIXF8yA77gnJdPqqUmuO2ouckn5R0ARoRtGn6OGB7sIziCf
         VbzmSpeLSIIPb6rmmziqOYbQe9+a5JPPD5H6tg9GuCQ8yEDh0mHhkFocDFcSznlXdfLP
         2puwSOTRcvtBHynNONyhjYbZdE0/sbDNsryU3w2RBkShAZFowoIAo90kBZQiMHLXXZC9
         NYQ8FzSedFKi6O0m6bJ/JHfpB3HzoYzGndwDKpDBNFW97/73/Y15tZ47ToRcWOP5VcHY
         iK1g==
X-Forwarded-Encrypted: i=1; AJvYcCVgMfDYAEeTdK6K0Aq2JzDq1xhQANu3TEvwcHr4SNfZ5MtG76bkYAfNv2xCk3bOFQVTihYv8Yrv/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRRXuUuVyEnpohj0Grk8LsbI3ru4rebz4kQ1EiRsnzr/916TSZ
	qDzrD5BwMMVx6FuYHxthI3KBvYWVO11oIfyTqP1gOwtVsAdYYQHBp7p7sArXdFV+Qxg=
X-Gm-Gg: ASbGncsLZ3d+rbUEiKvcnSTug6u2/FzHyGLbrJsg8pkdak7S2e/tZcF9+S2emAAxQ4T
	zGPRT3mMoWGk182YfwTmxRkvCFs6C68yMJ51i8odG9bv9qzSKMwuW564Wqn8BpMaFaSxHzkDMoo
	bDdFdJwQO4E7B0D9FWlbodAdxAVorW+hwG6hbZJJkrApUHZfVdoYasVpwMzN6G92jsTZg4XLjE7
	cYTGjyS7Cfe6+Ytk02Pb5PMSlay1rqtGoh57B5X4i1uKDuuKxdZtwtKTGH7Vz0+I9Rv6TWl2QFn
	xUSmtO4K8uuwa9kbyJCUU08UCE/39UXZYzaFhAyiPK5oYBmos5O0T356tInqhBZNfq4ncx6Yg3Y
	rztVBV2jSceO//8GYA5K81YofkXCcAwirYqn/c8SsNTnxLWWRxMTpYzXnLN9bH4Hkrhq/yhIy1k
	+ZSv/ilEJ3Bh1Ux8U=
X-Google-Smtp-Source: AGHT+IG5RC8qD54mIbAsxTIhZU1rpL+W33p8wn8L6JMVABPH4iQVEpKolLFmkisefx+eP01irVmjqA==
X-Received: by 2002:a17:90a:ac05:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-343fa527f4amr17253242a91.24.1763553412091;
        Wed, 19 Nov 2025 03:56:52 -0800 (PST)
Received: from localhost ([211.94.252.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc25fffasm2556880a91.14.2025.11.19.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:56:51 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:45 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: add reset property
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-i2c-k1_reset-support-v1-3-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=900;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=7CjOcGFE5wwSmpZcmbYOnGQ6AQrPba6RbTKMsYumG8o=;
 b=1Z0eoRX2dDGoiZ5ytJ6qWD0t24HbGAMxGDLnolPtr9iBAp3+NVNhtHnDXL+zj4kP54vcFHzon
 y5yhhsrcud4DFWaY+bGGEVZiNavy5wOwoXw5DE4VShZQEnXknJFCHy5
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add resets property to K1 I2C node.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd6435..2b84dc276ace 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -468,6 +468,7 @@ i2c2: i2c@d4012000 {
 				 <&syscon_apbc CLK_TWSI2_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI2>;
 			interrupts = <38>;
 			status = "disabled";
 		};
@@ -481,6 +482,7 @@ i2c8: i2c@d401d800 {
 				 <&syscon_apbc CLK_TWSI8_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI8>;
 			interrupts = <19>;
 			status = "disabled";
 		};

-- 
2.25.1

