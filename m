Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3BD2951C9
	for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828271; cv=none; b=clJvdrn9D3Wrpsdr9RaRD1D/wfupVjMOOmmxHzciEVztF7rkJqEFT/D51l9b8tpD1X6I4ADTM/yyWujSxKrE3E3CjGGjMoA3kxivHgtOikotVtMJjf1vqQJzyF95dBxIjDwhPHS2neTdFOCrytCq6n+BqgUWCFjv8i+Uubw7iOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828271; c=relaxed/simple;
	bh=Uoj/2NsPxaTTI2japwMQ43nh93mfeyzRyN0+brvXZjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpLp/KntKjFhFpjY4+i+a6kX9CHJjewxOXUTvATkDH83T8LGaPsOcBRlurJs+L8MJvEEUfNN33wWC0si+QLnBuKwAZEFWhO31XzBdPZfzQ1wuDlg+yGuPL4b7mIGCEbABiwwVYckdRW1BdoC08OIhz5juJEyifovITYHMSXCYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=YQz5259n; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="YQz5259n"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54690d369so1480307f8f.3
        for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828267; x=1753433067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIjJ267yEtDnmiN+Y1fTBADY4HhOVJqHNJYRhatCK9Q=;
        b=YQz5259nuPB6WEn1h30T5lG7EExwLx0tRpmuVSvCtp0Lybg36fY6G0c0Uc+B5UjBNp
         twK1aKwExRgJDDCctZdly/ZRy1Y1Pk2LRwG29DT6V/QMFqUuarsrI6LSF1lBHsIdO+o5
         WpolcF+oJBWhU8KaG4mEvmqfEanxf6TSdzbA8qigo5dXJwIesb+spNPwYbGRK06Am/Ql
         nrtcJACsDTpbJgtbfxE9Rc3LhQtnxnXNn9V5J2dJ4DqbTVnlZ8+6y5Xcdg/BUUeGPN/8
         n3O1Y0skIKohgNGVDfDdp9EzPznJ0KQ7wWREgX9TSWiKiJcUuVIUX2dhJ1KNWRG3Ra0G
         JQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828267; x=1753433067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIjJ267yEtDnmiN+Y1fTBADY4HhOVJqHNJYRhatCK9Q=;
        b=qYxNtSaQPHf1+rgoivHZx+IrcV8+Ge66l25T3ugTL59+0rBUEojTIJm5jiiWem4wU2
         kRXevEsxcvSHOgpvsNFg8RFc6+S/QJYLllbw+yfa/aiSnnGDZxpgF4WJ2MRS3j6Z5nKd
         VfhDLOKCc5bwCXe3JG6tUlvj2oJoHATORyfDsoplNw9c0flrPZu/5vgLhUCzVGeyHbJ1
         h3jjUsiVMFcJEhiIhg9o05/ytjyALxq3za4dkflsHq3uy0qOtVC9Hm/CfTN49LZa441d
         /U80uCD+oFpDytF4y6kp+cKtEU5L9eAu2PLu8XIbZ+ri0ND0wD7hPsvIDslQSNIETWQX
         HxGg==
X-Forwarded-Encrypted: i=1; AJvYcCVd8V0o5Nj4Crn9VRpUHAA5DjWkIFz7S6x/rYDNTnr5Ic98nOTl47skqxrL9W/sqR4bEHtUixW1Qw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrx7NNQkM22u/4BhCg7gUNGoFBtKWcSvrllcOGKV3wNpUS1cED
	dCwICebkJz3DP0cY33IP75lQxEwkih9GRPv1SqyS7QddRDT2t/DbnWWUYfERwZ6L01s=
X-Gm-Gg: ASbGncv6smgUp7rEjObHP5KaissWICXJhnd1Eu0V43sXXsy/awtsixGk+ziFn4gjcwx
	RgYroBNvoFG4X9HdOPUIcBbUgcIGkZpv/t2QU6Z9fuc5uJpiDf2+GCZzD5QZK/uFcxgFSoHL8Ac
	ZDy/WEAzrnrQ8N+u8htxTb3govs3eI6j5ItXnvEOZzfjFemHu+g7KrHKgtU0H2Cqq4qkv1eJXzz
	uOmkHbrq0Epw2q/04d6fRzp6URi7LM5LJeLZpLB++0CTDkUKRGtEmk97C9Y42HVJuRC1r/SDb0n
	Ko5GgaC5qis6rjXqOKNpQ/4+6CIN+RvnKbFatHpHmMaoVoy4X4EvJN9ptwxbxSIyptL87/3f8eE
	o1zyU/+9VFiGjm3NOmqqmqGCsAVDjSwbpL2bqVPDKMZaf7/Jg
X-Google-Smtp-Source: AGHT+IHMJeUs8RlmFkrQ9WTk0wqJZT629erQHVUIzMmI6akez7WS0GHbIEYfQ+fiZr6Q6Fy6PniGIg==
X-Received: by 2002:a05:6000:2385:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3b60e4c2194mr8115453f8f.15.1752828267262;
        Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:26 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Fri, 18 Jul 2025 10:43:38 +0200
Message-ID: <20250718084339.471449-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the OrangePi RV2 board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: No changes.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 077b94f10dca..c56b62a6299a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - xunlong,orangepi-rv2
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.43.0

