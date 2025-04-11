Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4832367B2
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377331; cv=none; b=Ap3Xt2Zzf0jjaJ4WjrF9XmRDp4OWIEPzmLvk9g+tV3Bkde+XV++tQCFsAUqMcwbJAN27Gt3cqk0MX2dVllNahDW46wTrA27cJy7zFayTjy+x3YVz+IK1tlXWVRsG1wHOniyEYl0XgpKAIb8kWQ9kysHGkNskV7BBUQVjipNjSQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377331; c=relaxed/simple;
	bh=1swIy7rxFEZEpzVbtoG003Ve9GvpHlafYnb4ccnIdDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4+3QA+zn5OB/hyw1c1xebI3NRA6IjZ+PtLiv5HhvwGeWkM+ypiFMGZP/VvoUezcM/hQJF00O54Bus2LgVZdUKJ+atLoqAurvjLH9X/vc16QXGsZevvHuQ4//h/E84wv4NZOc3MbiVBYRxF+fJ+11qdKYGYCWG45z73GqB1BnNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=t9Xqbtwk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="t9Xqbtwk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227b650504fso18804615ad.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377329; x=1744982129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/PuzfNro6+y5gilkjTT2xRfkKu3sAMB/YAOWIAOfRU=;
        b=t9Xqbtwk5U+LaqMmwfqzqTtfOYUWAvJjIZvPeBTOf1EE9QfZUwobZZW5k9CKYk2R0y
         +wfK/ZpskQsFM5j/gVkNxVBQnEmXIyru4MGjrCphCMsIR36a0DO9t6UqJX2AuEKQGG/R
         3CYeayOGSIW0hceEvNKp21WDW505apTe3RNyz9qmmx3l1TGUr2cAgRPSKd7v94xJ8UVx
         +iyIuYccxPx+eDUHgaGPKfqXkXlbjoevLznVJZ3sVmBwdDSAKryaRBVjLo0kUONCV/Zq
         isBSCRH+jvfwq9kjYxHKbnCSLlevz5Qq4TX+uGpKYwPkmpAKcluF1Ec63cUE9603mQPY
         Hhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377329; x=1744982129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/PuzfNro6+y5gilkjTT2xRfkKu3sAMB/YAOWIAOfRU=;
        b=Z3dFDMYKBTxXT/gOzObkf4DM2yNxZRAiISe2M7nAP1ThCKZA49l0qDGUuZPjDU4rRk
         zj6z+wvO5hIUnxLLGuoXumJLBTeEpN7CleaRGEnDc1+aICfvfH4sS3qlM4t4Yv65Sg+0
         hfLJ9cH5ArDV3kThysq7DWRaDmrp+g71RYeU0LkuZ77OnfI2aAayDcHrgW9PvH6z7ufo
         G/Rjxup2tYEnJE4ONi6tcgLN19Z74ky00c8e9cuH10tlBVqfw6S4Ory7P0IcEgFurYlR
         Paxbu/kgkiNpItlCkafH/qafn7w9P1pXvOoZ8pLj2CerOLHlz4hLhOLu63wNFwtgrq1K
         +X/g==
X-Forwarded-Encrypted: i=1; AJvYcCUGRSMCGHWDdPEumuC2m2fQC+WY2QukAd3CbWBUPB+3ayHQnr58acRxUlSV0J1t1eYPsRpiTKq3ZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YygcqRrL33yWeZsVgK1x9ezdyMm/hdLG51ZJhC8RGRkqMcAs26P
	h2YJWa55axr3Jka8b3nf0azAPcZHfPH4B4n4Wr5DBBfMux9B36IGTnyxD9EnKsM=
X-Gm-Gg: ASbGncvP6jtlUkkTQEuAFsxAxbZMgamCIJEbmlrUxLz9Y4h2PvGoNRP/9b0V39xzMlO
	ul1Swgi7DsHu15jcKFzxxQVf2cFQ/sFz0kT/+RQ+isxKy3EGOyKTOAOXV6e5Rc3ylKcSTi/6CXt
	l7/nG1TGf7qevo7qigeSecSpqESEu4slKWuPvDuIZMLXPvNYd2Rm8uzqmorex4/JjOBgm5Hbuf0
	jrgjHz/Id5TnAK+ZAT+3cEuE/BTa6lJjXV8jgkyb1l8XyX9dN4EL4RLQ80GMe+5nwWoTufA+ye3
	pfpEhWmwYBe2KDHToJFp2L3CHAT5gg8=
X-Google-Smtp-Source: AGHT+IHitAgPlQRhs5N+Pq3jnUrMsP733j1aryRrbpuBG1bREkPzJLptIcFojxxM3RnqxYYr08nnJw==
X-Received: by 2002:a17:903:41c3:b0:223:60ce:2451 with SMTP id d9443c01a7336-22bea4adea2mr41309915ad.15.1744377329094;
        Fri, 11 Apr 2025 06:15:29 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:28 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to spacemit K1
Date: Fri, 11 Apr 2025 21:14:17 +0800
Message-ID: <20250411131423.3802611-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "spacemit,k1-pwm" as a compatible string to support the PWM
controller on the SpacemiT K1 platform.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9640d4b627c2..1e3cabf6a89a 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -19,6 +19,7 @@ properties:
       - marvell,pxa270-pwm
       - marvell,pxa168-pwm
       - marvell,pxa910-pwm
+      - spacemit,k1-pwm
 
   reg:
     # Length should be 0x10
-- 
2.43.0

