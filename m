Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB303B7615
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891986; cv=none; b=OUNchCvDmJ7ADHpPxsh3mH7dAk8F9+2Wzq/NrSIUmLzBgo5Y2umwkLQlbE2aTZgTPTwHa4/n/jMXbq40W261gJUOXvrVGb/to4l+NadQxn3boXZL8ea05s3sOXhbpbIoaxTUu27UPnD4XVgXA9aMKe71TAPisL8IOUrmgcID4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891986; c=relaxed/simple;
	bh=hMk7e9sDIbndU8jtxho9DAKUxyuGQV2QeCg6OF24fgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/XhvvmII0nZS91BC0cmJRGBH5J+KUozlgTL4zCmYWrfGSIneSEsTRqG/zj5YHVdEPZHH2+gw3G/ja/mIMcFC1lgrBzT0S262rWvOjG2If5ey0Y64WEPVFDfUkvdPPBkLZkoqG885SmzAgeVvFF3jEFKjrP4JnXwjXirJjrVNG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HXMKK8kJ; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HXMKK8kJ"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29f2676bb21so50069495ad.0
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765891984; x=1766496784; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwieFoqD7GSHNJIXxDJ7bzO+eNbv0m3QCXE/uSRPY3I=;
        b=HXMKK8kJytfo0Jg5Ed1yznOvsVXi6AmVeBXhtUkQsIeV2LUr/3NFGgzKCGH/TyJITl
         dfK775B2pl6oWR4PKRYc9kJI84BRVo4xndtoJKuBFAqeAdTztckVS5ShMLXrj1/nZzXr
         7u/T23v0e1Naq5hHxb2kXWbqJjPN58a/ltFwDJoECtf+EUV6Enr4od8FhbwVGk2JhDoN
         o/UwHzqzXNL/qAJonjgq0wR9i/RDB3iWQC3y9PgFxWOjqyb7FMXquv2THomd6PKTS1uT
         eovt6llhcajMcVA9BUy+fHJMZbSCTJPdIrChmXu4w9K4jSDI+V/Lb+pTeA/V/Er0Ydxy
         teQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891984; x=1766496784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwieFoqD7GSHNJIXxDJ7bzO+eNbv0m3QCXE/uSRPY3I=;
        b=cXmX9FjYQxToP/02yLRtz8CzAiA9s7IMszP2tdzzTq99acgGyhE1zSpFZFpVHhx9IK
         reRuO+ebhzJk15eMxgAroX9qK2970gMKTwt/1ob9i1CwBcUB7XyD9eCKRdYYZZV2LVZE
         yQ4/lK/9/wcVKeOOZPfC6lXcFPqa2IjCGCFaX02hjdaoGRpmLM5C48hzGCORkZggoJh1
         IU9AbWM6V8B3R+wtf/flgUcufDAgHl+0z5uJWg9PUnGJDfc37fEkn4GsQUO51pDXMeF6
         Q1qKlIXTTImSZVvgc7LZzqfmCb1ZPd1FpYa8wv6+97bSORQuAzEvTf+F/yU/tatyy3H5
         Hp9g==
X-Forwarded-Encrypted: i=1; AJvYcCWK6jyiq6prDYMjwBlbcOZ0kGo604LETkV/VcZSXxieQmqAkDHyqR7u2d0ijZ5mPNLUeQxm/FNDVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOrKA+OJA6gY5GNazcaxi5QHC/jvtb0I+/FAoEKDX1jkpAji6C
	IwqdxBm8g/3vft5U5jKOAFgHuBWlJBz8sRSc5ccgt2q6GHX7Ph+S0StdYPYq2ULiaO8=
X-Gm-Gg: AY/fxX6A9xqxCeMVl5tJJXMurwtVrvlRSACwKXs+yR1HElyBJf2PqUIM/92jYkWivir
	m71BF4MP2zSpTHDFUq7NpZeVAtZv7GE5o5ivetyCB9kj6raHNvfSMeO8/Qhxyc3v8/GatL02cyz
	PBJ26GrQwPpwZREkxBtJFk9xBc7H8OqD3TS85h+5ZCDLlv91rfaObG9I5vNp055XcR7g3PnxqaM
	cGNJ1fMrkApLwraiJVyLsG+Zdko/ShksysUgPkmC8IrZXguwLs9RULoxSNvWCI8K7K3Km6ZZv6x
	gm3iWXHVyKpMJDEjahuOeH7Y4OabPe5WH0EdlyGNCrX2SjDApkjJKCZVv9oMMBOeKo/F8UjOF46
	wXkzl0tEv+wYk5JSCucCamfaG5jMYZoiFv/AdS3VfSg2c5mrS0Yc3O+6vWxiVomIURooNLhCmLq
	tDPUfVXF5tfkBPi0en0GM8fUu/4Y59sUI=
X-Google-Smtp-Source: AGHT+IGHe5/9SaW81jyDKkQ0OPmaYehcP7QMhJzz2ZDa3a+RaUWBBtXL3A4tMbxbrOk89EkkF+fCWQ==
X-Received: by 2002:a17:903:1a2b:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29f244aa9e9mr153671045ad.54.1765891983667;
        Tue, 16 Dec 2025 05:33:03 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:25 +0800
Subject: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com>
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

Add compatible string for the SpacemiT X100 (RVA23 compliant) core.

Link: https://www.spacemit.com/en/spacemit-x100-core/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534fb63ed7c0eada97c42832431f1fc1..cce87092dc7749f49066154d9a256af6c7b6c19f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -62,6 +62,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - spacemit,x60
+              - spacemit,x100
               - thead,c906
               - thead,c908
               - thead,c910

-- 
2.43.0

