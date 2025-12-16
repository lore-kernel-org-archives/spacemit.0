Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F5363C71
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892009; cv=none; b=rmmZy/US15iGDm7UoXPK3LPMukCjuAFwV6GLGe/1PKNrgl9g/imOz1/MoNjmlGzl/2PrqVxaUYwnUpLHa0CDxlwP/8zvOS3vMudAsHk6bxxh1Y5j3TodHYR5GBDuMQ8FxaNU7J7lGTg74XlLcOLQAPDlcDYtdknCB/1T3wGOngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892009; c=relaxed/simple;
	bh=bEvkKfpGvLRG5xChRyMfGRM8paMP5NXrDcBPWFsx3Fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCuZWSCkc5J3SYNqwE1AZxfcd+C86rk8mthOYb9enxapwtMBHdFcCek0e6CFBeix2btSVYioFeZeTpdVqJ/HVBZb9ImK2ryfRNVFLeE2k8reRSG96UBj1irZMZWJL3BO3MzUoxefgVBqcrLuE0DmDl+wFoyGkIC0L1CWJqSZkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=e9/JkBw/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="e9/JkBw/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0a95200e8so25408305ad.0
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892007; x=1766496807; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs9VW0IfWPzrbiE9L+0r4Qf5TkuQRPp65nyjMqVUyYo=;
        b=e9/JkBw/rISf+r1gOBL59AxrJ9DX/e2RcnO3PKltQnaCxPc9ZbdcYkPkt9rk3mkEm3
         KHwr9kKE8kcSWVu9vMtE/+wDNXFN1wO2UwgmOg+SFUqS6F7647yGwI2sEseK5pcYP/n6
         1C4VgqQ9B+YMDW1W2+SqPsDydv4SihwQOAjCpLX7XhFf+IEKmcn2xWjw1kmne84asHZV
         sY7dAA3sfl3iZE4faedy5AoipXW/SSEnsXyXAxl1c8yYsCCKHozGyy0YhLUlKmLU5lg/
         ayFcgd9+TxZ51n2q6h1lzh1d8CAadt6b9rj0ZmDlH8ZsV3AU+hio9z98AHcSGt7ixlJM
         29yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892007; x=1766496807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rs9VW0IfWPzrbiE9L+0r4Qf5TkuQRPp65nyjMqVUyYo=;
        b=XzPIKGs4LfoB2lsFUiCh2jDUM2hbfbThDce4pkM0z5Es3o3yH51bqZ3tKmFSEOj1+t
         SfCmLJzgDI4pioGumupL5ddWaPPlQeYTIDDkDtFdngLfYi5j8xzoT0K5q9KcqJTkcd1O
         ghxeDfZNwavkiJmMEIY6dY+m8nhDNzVfdhd9lfcGSZP5gC2kZs6JyYvByHzX5UbQN/OU
         ajDQh2UxPXA1w1P0sDCKMOUxSRBF0RgH/dzhMw9cOH3n1xXMq1Z4oZIGoWzstsCuqRRZ
         aGi+JAAswxpNJ68kAeyEwVeYe3OE2bIDpO5lNlwbiCTR3clqnK4So7I2u/X9bSkCNnrt
         mQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1C1G8I1N33NhdSXehvohfqkDPvhhQCSTw0c8TgM+q39DoooXfk8eZfyU8TEo0BR4y06I2cRWc3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YweKNcUF+Xay56FMRNECFILDmuQxYH1JRadoo7TAFTPPeqthHdU
	mOL3C2l2yCCO2iEac7ph52mYQObCdKcEfKPhklJVGTWtJ7Akr7yyj7d/fhjQCwdboqY=
X-Gm-Gg: AY/fxX57E/i/or0h97VhG3H1hDwePaKyuP1J6R09bP4kWm6oW+FrZuQmpJ4KiHoBs5X
	B/lSzBnJjNRe+RVJ5xIA35kMJy1ccT+4mrvp+vPeOGfGwKbB0HSnFboinzZKhY08lVxW1VuIGRp
	nxOfuA/7mF3uLb+3GYhXo4kQ77H/PG9Ys5L230r+16bo+vKY1ejOQZGaldBP6yUGd5Qfxlsur+a
	9bxpot/aBe3UKgj3FtzZ58A1m5pznX5t5vLinvRuPscOsg54wV43ig3yLCAkNkpxBnG1CzpbTLK
	OzSu982JmAz6RE4eYNxzAmVpSttsi1lXKo4xIC1qdWipl9UrzlJKv3DEfOBzgmogD1v6S6so+8K
	yADrn8dGKiNhI/URcJv2eGBwM2KwQdKdZj+Go4H8I5fV/5dr0mYZh9nyMcjNRa8lCpXDJKs3T3g
	T+FjKHx7xTnbMvSCvz6gTjrAKwruvGbYw=
X-Google-Smtp-Source: AGHT+IHYO6VckBIE/NKNbVNQkjVqL/H4F2phLWFUlelSLlWr6JEkHmBJoAON7Tz83USpUb8q2a1UVA==
X-Received: by 2002:a17:902:f686:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a0abbaa7aamr118026675ad.2.1765892007376;
        Tue, 16 Dec 2025 05:33:27 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:27 +0800
Subject: [PATCH 3/8] dt-bindings: interrupt-controller: add SpacemiT K3
 APLIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-3-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 APLIC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5dacc002d24c50843ebe6380a7d5524..0718071444d29fbfa36283fc9666e8cecd6f77e7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -28,6 +28,7 @@ properties:
     items:
       - enum:
           - qemu,aplic
+          - spacemit,k3-aplic
       - const: riscv,aplic
 
   reg:

-- 
2.43.0

