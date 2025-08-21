Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC52EBBAC
	for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765133; cv=none; b=JBh08mN0nsANFwGeWepaXfH1NJ8HBBJ2zsHV0pkE0l3Fm6cCzry5Ezsqrt0hGaToPWcr8Obt6AG4kkdpVcvm9I4z3cHUtv3o7i3KcZrWbRVFsVr1x8hDDoheum96agVeY5wBCS2biGbwBE3KX6Id1UIQ3c8ht1o1NbhCHkVdopU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765133; c=relaxed/simple;
	bh=tmlq5TL4b9hR5e4/dbfvMZDDic0MixP/CpVI5rMMnYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSCi6a5C12VfPEzB4XKsgpxkRxFiSSrs9gqpO4LllJqI8q0ja9T2Lu3mew926n4VFKOcxI2SfYAL1o5/wwCSzLt+FS1mBtHLGHQGDHEPz6pa8B5MB6dvCqNagDR0/yymMho5FYqz5GWeMhwpGdc2OIXdZTypxsIfbUI4E592kNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdWeyUBz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdWeyUBz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b67a951so138767a12.1
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765130; x=1756369930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRvAzDPMBGNTB2v30IPH7YjhXyJsEociQ69t9ryyTSo=;
        b=XdWeyUBz8XA08673AUGIDQcJyvv5AIXstmTaBzgnVp5IFZR20RRKxhbn6DeKhCeoHE
         jpChCDt2wpJD/EDIR4kpbf4+dBg7RvcGf1T0BeH2i2tO8eLyjBLlQqLGFEw1NINkArFR
         Ma4H05NQTEzPMiRnJgPfg2HP9ihxG1nBLnpNwsIAu0zLKYXF2QPObzdH734HmY2ZXt4k
         xs4b0GljjKd00sbxcFvZbaoTHll8uUyleG6U67r74nr0yBOxpkVgmJlvLzN/bHqiNawT
         Wv1iHfgFjA26U/4lNzoicJoXf2pqWP6xMBuF+mudTeQvMwzPo3seh7N/Y988u4YVLBaU
         sI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765130; x=1756369930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRvAzDPMBGNTB2v30IPH7YjhXyJsEociQ69t9ryyTSo=;
        b=cfjzbu95oeMrOlbKzMSZbY5UkPVSlRqiJIF9xmy+wmZ1w0W7owTIV71x6OU6AzmNmk
         O5uWaTHHcri2czaPeW34DjUubjySJpy53VHZTGz0bF5DS2PrUzLzvEdjBpEHCwPhPBeQ
         L4oWuvVIeIQ61s/YrQ7y7y5eyzHQxY19qK2gF2IH9UD7O4GbbMAQ5QbXNh1HNh9wuTH6
         34mWYp2zkNsPTUwWkpeIyCEAtkJPvz4XYOJATlQHMj4cwPB4dOZoqG3rpAMDB5y/E1zQ
         rkSEzMatelsqYjwTBEV2DfcDHCODHfm7HGLqV1UI2ywwZKWQpn/TEy2fInngKSWGntNT
         Nelg==
X-Forwarded-Encrypted: i=1; AJvYcCWI5obbxVb6HtYKJY/07VxYKOcaxDvgM09l1QRz1bgAyLTiQhR6EuSg9mFSGzCnbKOkMrsNQPdWdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvYSB38Qy3UFYYsn9hrDg+zCjDFFoRyU6FCcLB1GiX/gUSwpis
	U/ca7eZzzFOxh9FKA9gh6DNkxkyeDEMjsPPoEa1QKMObn5UlSUphWR1cNlM7ZKhjoE0=
X-Gm-Gg: ASbGncvRj7VbwLQFP5RVfyKkCiZsyP0R/TMIH27tB2PadM+D6NKYVGJwX/F8Ywr6+7t
	Apd5tzxhkDOxX9+T5NbD/FBzEDG2nJttw4FGdvzbHTPmJFThlV/rfSGU6abWb0nldge6+pTlP4r
	OEThiaqOTDuoimyb4vkljJzj4KgszuniplnzqJRJfbBCLxpQ2/zSBARjtg28erRdaWja29mndUK
	O31U5YgVuFSidFFv3CBiit6bh8D0bXWm7OUoRza5B2ucjUUdPo6vD9Yd+dFubwVQ/x9F7S0YGYF
	Xg89cQ6UXSIyDnEagjVKZaRO4jPCCC3K2QZM8aHMizQdmrb8YYy8NaEu420LJtA/AO4mVTouAVU
	dazW0Jjop9LjFYDdmTpzaICNT3CkcbRnT9Q==
X-Google-Smtp-Source: AGHT+IF0yeyXaXIgpuu1Hv3lLvysTAldvCSV3g0j/RrKOaK78LX/7Pw9plJf47pUTviNVdCxtnVOUg==
X-Received: by 2002:a05:6402:40ce:b0:61a:1fb2:3297 with SMTP id 4fb4d7f45d1cf-61bf8752115mr668450a12.5.1755765129957;
        Thu, 21 Aug 2025 01:32:09 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778077sm4761880a12.35.2025.08.21.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:32:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:32:06 +0200
Message-ID: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tmlq5TL4b9hR5e4/dbfvMZDDic0MixP/CpVI5rMMnYM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptmFHk9waBle4RJFYoExNjWScWzn/KVPJWdEW
 BqaXrS6HQ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZhQAKCRDBN2bmhouD
 1x42D/485/LVTQzYX1z8T4Dqq80f8hCQ+UNg/m5AB19ZV8QDVlKt9PxBtXSYVlrqlxXdGQNHCSt
 LFf2hNYV4kNJJ+h0no1myzXlxiZ9WTZgrMxi30rVtI45a7F/oSaDRvYeXuqO/Gdrn1mUYd7Y1Vj
 Q624yu1hlY7YZwuj3XOyCFCMLLRSfOVmhJWLqJwGuS+4KCFfrb2YepHxi8ASZ5xbpWadcUj7OhQ
 Da4NJRGWPR9PkJh0O1u6HIMIrmWv6xW68tYEvSV/VwZDAwAXvUsVWLDBtnGz5o/+5+1bz+5Fxmp
 fJv8nRx5XnfNkhPbNzy2v4fbLJPdl/V+txbIcpSstL4K6TzBime+E1H9TBfD6AFS25ZgnpnIVyo
 oopwye1lfa3leqALpx+l6SRr5R7w8FrZmfK0C0IsV19Lk7eJTPxl9R8KnfFKAtVe/xoLmH2Uo9r
 SjR6c2JH5JL2VNFDmgTG0VZ8OqKsFy+neJ7tqzWI7vbMCJL/xY9eyVORr+41/QyeLu7poqivik2
 nrquKx1qCgtciT1Oxcxi0H3v+KiNp/l/hVlnJEdHfpZ/u76Z4tZ7UOeiksLT+jWbXUObKM8Mi7B
 3LUIMoaw9qrvLJnSb58pUofJauL/oGGv23A0Xq9P6+uQZZtC7HyScojqleglxnzrviIq027h+hS h63Oi1GCs8FPyPQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index 3d6aefb0d0f1..c1a3004df71d 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -53,7 +53,7 @@ examples:
         reg = <0xd4010800 0x38>;
         interrupt-parent = <&plic>;
         interrupts = <36>;
-        clocks =<&ccu 32>, <&ccu 84>;
+        clocks = <&ccu 32>, <&ccu 84>;
         clock-names = "func", "bus";
         clock-frequency = <100000>;
     };
-- 
2.48.1

