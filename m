Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA6226D02
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408838; cv=none; b=TJ/Xw9q62oJvS9LVAGKDYyoTj8WMPUzET5HGBWuWD46GcDA2NaSM0n0G2OVtduhjaYRPv9IVCyNNtBBp7c/el39N8v5lneePOqc4YPtB6xqsGpQWee5QPf/j5yw9LCvEs2FaeW3nIo6lePg5DsbW4xMDWkSVoU2siwHJrG47aJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408838; c=relaxed/simple;
	bh=OBOvbsWkB4JX91DLbnwWud+gbnMSideHZUoDSFjfq0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxhUz5IuL3BWP8gWzOUleCTj8QN3upEq3JjD/HtNpxeRVtzptEE1b5QYgmaJrWzBSHdA77kExGdFe2T82erOKky8epI9HZ4HplwcEDqWPV+JFI9Xus1tGjAofvziZiuldSUwH2nEjZesemkCMyYtTraKnfvBQXEkA81r4w65INI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=edOlPfUM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="edOlPfUM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so3342413a91.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408836; x=1767013636; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmSKFLQJJOcL/UHZMWYDxU5qPoFtgd6eohGiohbnOX4=;
        b=edOlPfUMayg6FPUpzIhTe3/14chH0fiONS5DmUNPtVrIAuQ0Nq0oKzpGmALPvPykw9
         L2yn8GB001iZ3v9DnB32P44G7b7gZzi3ACKeGwAkx/seBv6Bz5RXxGb5N2I3n2fFqgzv
         c91UxF7/9kJsOXsrfoQO8LFDAwjeqrJhF/vJG4sL3GDry9dQM1jd0LSowX2ea61vDPNb
         DxHZecQipSZAt6YxjZLaewCpAZbdFbk3TgdMEt7rUmsi41Gwg5HFps1pFSz53TbJ1NZ/
         KICfgTzXUS75Yq5rCY1BqbOWiZ0ml+pBUX4wo6hFK2G/gWQFNo6XjEb5kMVU+M6yX3mn
         /C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408836; x=1767013636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmSKFLQJJOcL/UHZMWYDxU5qPoFtgd6eohGiohbnOX4=;
        b=f+wYS/f7Y5ix+u6ThwzubfQP+tvqN5K05hgettFki/La1+0oNnTC2zksDQ+fgBgZQu
         m3wzNQ3LEt2xplUmM/YOtwshDYFlovT15vXfVqLYLZnqKwjeevaLu5EeNRcSp3sX3wW0
         KODaNqeIO9oswIMzEkTwqkrLEZkkVbL8qZ7VsMoSzTGaK7EvEJbt/WumXeAF0ieYkFBC
         DiFiRXAV7pI/oPCfmvw+c1R2PgWRoD6ZkGTT0bVNAc5Kkd0ybPVpe2pxXXE/8B7QZ8xj
         Vj5mmqEKYY5xAL4wkKdPN+0ys0B1Of8pIeAZkCZQOsfRqClXp7YGySdZaFnRc+GFgE2t
         o8vg==
X-Forwarded-Encrypted: i=1; AJvYcCVkhmq7i3dAE3urbp7UzhLSIbYqnBisfFEs/A9sQuH2JcW1zuNhxIhengSQUsRoBqKgt8ns2Qzxjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1wZecokpmfkagzui/knsj8IjQhYl0/MCoBKXNtUxI5ur3X0uS
	EpXsQrw6HVHLRYN8o5Ucca2H5w00MKCUdQg6W7kfckx5YKge4x8A2Qgau7t5ZBHn4WU=
X-Gm-Gg: AY/fxX6n6KDfnTwbsPHBFRzMfj3gRWEcq92Y4gRj55O26v/F6Fsbtl52S2sc50r/bwy
	1SgG3UIitFpMmUWpZ9LFcd4CC5M1uH5kzERGn/zi0Kg5FPZWPltfL8Bav0AbdI7Y5sqca7ESRBm
	jIkdE3B3p5SVyN0i6cmntVl/8kkpZxhhhXBpmRzTW1WVtTpy+9mZr8YahQg61RgZ5LGiYJzntmW
	uztVovUFi17KMJyZVe8KL/P+2sroNfoKEUClJDn0dPuu9SzyEGu5x/bN+MuiLBzPfx0yDLiftgM
	tBS2JFch5nxfJiIHO2y8AQ1+SWszLmOfcTpYa5inMoB6F2NjdhJqzADYB5qo92mHRyWG3bCyvXY
	OmWv97m0BTy5Gunarl7el4wB8VCUzQJpv7zjz671DpskXMg6eLe0XkYQ4ZIT5fTNDU3vu/nsvg+
	YsyK+ffnrp6+fcMbeyCw70bKgUq2v3FvE75TnOdzhxJg==
X-Google-Smtp-Source: AGHT+IErkmtgUVNEtdp486aXALGkmaBg1W9XZAspgQDXTKlho7yIRKAUKoJehNC2P2iVciq0Y+zRRA==
X-Received: by 2002:a17:90b:4f41:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-34e921b73b5mr9241301a91.23.1766408836378;
        Mon, 22 Dec 2025 05:07:16 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:15 +0800
Subject: [PATCH v2 05/13] dt-bindings: serial: 8250: add SpacemiT K3 UART
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-5-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2

The SpacemiT K3 UART controller is compatible with the Intel XScale UART.
Add K3 UART binding and allow describing it with a fixed clock-frequency
for now.

The clocks and clock-names properties will be made mandatory in a future
patch, once the K3 clock driver and device tree are merged.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 167ddcbd880058b6dcea9ce33bd814ff8ba6b0f6..73851f19330d7f9fc254efcd32b5977feada0b07 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -160,6 +160,7 @@ properties:
           - enum:
               - mrvl,mmp-uart
               - spacemit,k1-uart
+              - spacemit,k3-uart
           - const: intel,xscale-uart
       - items:
           - enum:

-- 
2.43.0

