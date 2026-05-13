Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC033D646B
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656814; cv=none; b=Ob9cxCKu1J/M1Eu1IjIO2fgvD9qPzRgf1CZC6mV2dYBMeF4QQIhdRI/eJdbjnGAFZOwbrRYL+/n3Xdr0yvlcsxpZCyVwQtsFyJZuWEUwLEkTdgqw9z6f9moyXIxES2Q9jpcRvIdGyHRaPy7/pMifeupQyZ91RkH7V9pxygmCaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656814; c=relaxed/simple;
	bh=E/3dwCOlGKS3Bh+L2ukpwWaK36HqCEJ6UVHUKxK4foM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9kFoW4VmhJt4xHwskMwCUhwBdx5ocUSNBIrTZCYyMl3PbnhG7w2g4UNU8XNKiZGSrXm5DccHrmveG1hOwUk877tW8sJeCTkECiUXVgej3ThpCMor7VeRFfhhUIG94dYDVGKbsol9YiOigeqhtpp2+EULAmFcUUUjft0yGTsxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0VTCqca; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0VTCqca"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso55689155e9.0
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656809; x=1779261609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syWeBTQoOGeqJPlWDI1VXqDojdsh0COwwri+Bm1MZY4=;
        b=R0VTCqcahqqy4CFpzO1G70NZRAfrJdR3cQFU10HCGf7Yb65rmmkCJW5MgnXB1kW59G
         qZwpiZmEd5kWkTeVoqTDjI1Mt2mSgHaWhMOCAO0We5urowbxlIZDY0gQO+P2UUePGKYM
         OK4R9lhmiCHl0RJo6PFD1Jgp4c+kqCkk23VMOKoLN+QOWWSudRUslsuPKA99BxDsHJiD
         saWkMOgAiPEN+hJ3ZdpMTn6InzNCf/eIMSqC9wNsCWgLDOHnLBUPfNqmd8gkj4HnYHp3
         fUieANSrdu78PRlSxRE3A1ToBUXNTX4wO27kAEMH1lr1oS7PpFr+FJrv4gZTkIuamh9Y
         U9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656809; x=1779261609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syWeBTQoOGeqJPlWDI1VXqDojdsh0COwwri+Bm1MZY4=;
        b=COvaOiVK1nr7glleOjxO6nt71wPrDkQS7/xd1F7K98kPno0GJX0CnS6mTeAVCO3oBG
         dz0EX8V+5v5FXAp6i5bYzltIEvlGJedZbh8gYGIGh8KliQJ9N+Ka+r13dTRIXwHpdWxn
         M0mCI5/otiWDxBuO+I52wsm8BzCiIfzhAufukI7Ki1qjQJcDqTfw5P+9e4uRuCl9Duxw
         efTvlok0oXTTbj8xOmWwbRUCLtrMrK2tqd/5ZxAKp4+KITb7Avk8miVfvLTrcJPi7hOa
         DdwDRvvqV4ZOpiqDRdDx9R+WcP45aRO0uuuwrHgpgc9tcgphu/hrX4wZNKfOTys3SDdb
         xiTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lmWiJP+fvXQd8QOxw44dB5HGoEofFMhJwcAKToxrOJYx0kHsPttMpl/rrMMlA/u6NC5/npPPF+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAtNIq5CBryrVGNwQBCMixRqR01lzw9swimS+ztfHXXP6xqIPQ
	uustx0RvZ3/0SmYjhyAAGf5sy4pLj9YxaDweS64fxFv8d8LoY+fJ2YsI
X-Gm-Gg: Acq92OHJuDx94ngqAfWj980VreDs8wHolHQvyI6Hoz9lSFuULvi3M4sgHN0Pz6/i9XQ
	LWMkC2UPlGj0jPv/IyP4y3yBWZZ7rdbOEi+Dm84SihmRQp58j3EUNU2zkBNgVbkxECUdh0JxLsj
	/FhkU+6MN6gMdb8O6/lHtgas/ncnRvP32HKhkNa0LypxSg6oDbnkwlC4S/4JfWrNL5nI5SiIs54
	c3gDSK7lysRXBLxugSn5izeRrYTDsxdxMjvRjYOC139SW+1zHvWU7m+n/qugNtrcK6gp4ESwUhL
	9lqkYwkYhkzF1LRPT097CGdGHXapVE6hzzalPRTfGXRSQQ+1XB12gcsKxkCgjq2nQ4KKJgqDdYn
	S+UqL7JOdfL6arPjZdikwzFdS3d4wSXQaL1NtJ26Joj2qYi5/I2SWx1fxf9R2dNg2U/kFs12rI6
	5CG9zH1kX1gU+FnFgohueqp7Q3AIgpzIb6EccFnOLyNwlVi00eJYSrVmAVkKcqSn8gTQ==
X-Received: by 2002:a05:600c:3013:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-48fd1c05f08mr5439785e9.13.1778656809169;
        Wed, 13 May 2026 00:20:09 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:08 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Wed, 13 May 2026 09:19:54 +0200
Message-ID: <20260513071958.29574-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 953c0ff6a0d34..ce7caf6950dc0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0

