Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2486421EF2
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875237; cv=none; b=kj/TuZWvOCvcnoSdZEcGneHOjEAzZTwp8loezt41JbCr5a1OCc8FT7GLUZHs8VBGS1vgMeix3kgyDPRVid6Kkm/0zirUubkH1qLcFVdMI7qzUWaJtO6GQiRMksvaC10C4n8mvV5aA55Oq6oX5eeKpD98Vzl6r3L7G59yw2Z5V9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875237; c=relaxed/simple;
	bh=JNc8LtlSqbUM1gYtb1AiNOnq7DSnYAfiDqB4gjysnbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LboGM81mzVCweZrODQRhz/zPnsjls8OBhbvAl9EdpqW4sKyvvM3RpTp3I6xBZWgbUBIGRKCVy6MawhiQykzKmuYbhd5SIJViKSnPY+1MlrhX3qRtLVOpz96u5Bsiuo0L4bW9OSuBbZTZv8SZfyui+g1OtByk1084aqLgOF5raVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kbf3/zf7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kbf3/zf7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so2973204b3a.3
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875235; x=1768480035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQRNhZyBrryZ4W75vN/HbLrPnH9UQ6pAq5yFj98AFr8=;
        b=kbf3/zf7x3yeO3qk4HsSKZRYZpxiCeDSLWGlqweAx5tkAzeWf0LwwKW6uO5ISJVOpn
         VFJUF6pX3Egl7fDYH3lBV2b1iYZjPDZiqlKNqJPjtWQV52UHE4COpPMihj7uLXoXWa5U
         esP3g/Bdpv0MyJACFBUhZuCm1emrU5aSXiMvHqdlHsi8m0nLf7sYviAP9A88b5QQwC94
         lSxKjfcDdb1+r0jQx2W3rxXmB45GW2MwxljQMLhitcd3rVdQzHxMUMFTCDLcbOHil2YQ
         RBjhvuGL9dz9P9WWYzIdDWUJSO0+elb1ve4D+rYTr7J05wJDVaqc2YzPIAUpcqm27G1x
         qXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875235; x=1768480035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQRNhZyBrryZ4W75vN/HbLrPnH9UQ6pAq5yFj98AFr8=;
        b=Eb/sJPwwJLum5cHPhgJeJfHe60CqSg6OyqwFOY/dvsNslE/AfQ9VyN3AgIMHxlBjbB
         ZAyVKQTA4UruUdCOlqNr6SsWrCN6nu8oSk61KUX5g3G7A++UTkyJDfOl5VmKJSQTAxsZ
         jhsMdJujub6U9n4cs0PGX4TYPJQu0fV71oyZesaW/JTdAQ83Qo6XIb3QJtfR8iNSh92v
         TYSbAnRivfTBA8m9+DHTAlJC0062/RQTeentGYNbnzg1GOJCoPiBaONXOzrebavqNjR2
         6F/U62f7S1mWE0B3u/6GfaG+ojj2+8jYFEPuTuh2/Wk5onFvztW8D9e1rLOzudTK8l3W
         x6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXayTy2RdDHHcyIU4e6JZX1PvkWVzcZFRRIqZHEZSiqaTJVG0jUvhihV3CVVLcXuloNr81ZIIZkGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMK/BXTsUT+DbuzTaMDFc/7SAEH+AO2+uapm6MA9v01lDUNHHY
	TMzNtodHWS8QQlr/fmapA/3SKHPisRTwYMsA7WbZXNicXXc+gpz+b6EKXQl2YemHWq8=
X-Gm-Gg: AY/fxX6W2xTmjT9nlNE4uSGv8hgcm2wI2rS2y+FsgfllrEJGWDTNPyNUxVTdQYmnmGz
	crfIz4yvGyKm0DqqpzptORi/sh0cSMW2ledn/7RBKfRrI3Nms8nhOnkAVGuVsyItflI5tHUSNI3
	hsBcUZMHitDRaIpKBkvrDAdwY2LGl251sj8Pt98leZsmxP3Gwf0zwc8mAjJLEWZqpMRbl1Ibf9b
	AimZ2YjwC4ECFLBJc2QHeWxWl+shVuQT6xOuAFymqB7APXKi08jm2K9y+3s9SuKuBWWXItkfp2P
	IbAxDbNSMEXpXumiRAWlQJib/S+lkhcXfeF0/Hn+z+XLtaTI6M3VCO1XBJWnGQL7NVWsDwoyC71
	CdQHNCBcaVBFxUEub1ZlRKwT3Nwgk6S6RVNKZFJyA58aJkG2fpJ+TbwioTqnZPqsylFKYgziy08
	i1eaibZQlduBFfdRI3a28qhdLCYHEFBHs=
X-Google-Smtp-Source: AGHT+IFRYciZVmuwXxqgs2+z9bm/vSux/mZP8+GYdPklVFiskGwlhaojZKgF/mVDfvC0CzsE/D+StA==
X-Received: by 2002:a05:6a00:1d12:b0:7ff:c51d:7e0 with SMTP id d2e1a72fcca58-81b7d3584f2mr5778224b3a.3.1767875235211;
        Thu, 08 Jan 2026 04:27:15 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:57 +0800
Subject: [PATCH v3 06/11] dt-bindings: riscv: Add B ISA extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-6-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
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
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add description of the single-letter B extennsion for Bit Manipulation.
B is mandatory for RVA23U64.

The B extension is ratified in the 20240411 version of the unprivileged
ISA specification. According to the ratified spec, the B standard
extension comprises instructions provided by the Zba, Zbb, and Zbs
extensions.

Add two-way dependency check to enforce that B implies Zba/Zbb/Zbs; and
when Zba/Zbb/Zbs (all of them) are specified, then B must be added too.

The reason why B/Zba/Zbb/Zbs must coexist at the same time is that
unlike other single-letter extensions, B was ratified (Apr/2024) much
later than its component extensions Zba/Zbb/Zbs (Jun/2021).

When "b" is specified, zba/zbb/zbs must also be present to ensure
backward compatibility with existing software and kernels that only
look for the explicit component strings.

When all three components zba/zbb/zbs are specified, "b" should also be
present. Making "b" mandatory when all three components are present.

Existing devicetrees with zba/zbb/zbs but without "b" will generate
warnings that can be fixed in follow-up patches.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Update the commit message to explain the retionale why B and
     Zba/Zbb/Zbs should all exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5bab356addc848abf8240991ff525c619b9fc0dc..e026b366c8f5dbe7d6988d3ed374183c165de35a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -109,6 +109,13 @@ properties:
             The standard C extension for compressed instructions, as ratified in
             the 20191213 version of the unprivileged ISA specification.
 
+        - const: b
+          description:
+            The standard B extension for bit manipulation instructions, as
+            ratified in the 20240411 version of the unprivileged ISA
+            specification. The B standard extension comprises instructions
+            provided by the Zba, Zbb, and Zbs extensions.
+
         - const: v
           description:
             The standard V extension for vector operations, as ratified
@@ -749,6 +756,30 @@ properties:
         then:
           contains:
             const: f
+      # B comprises Zba, Zbb, and Zbs
+      - if:
+          contains:
+            const: b
+        then:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+      # Zba, Zbb, Zbs together require B
+      - if:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+        then:
+          contains:
+            const: b
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0

