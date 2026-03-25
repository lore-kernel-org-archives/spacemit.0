Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1ED38836F
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216199; cv=none; b=J+pRTPvgT2Pf2eSjvh1sgUTAbfSgfcg193yQeHAtfs+rFqUh+8ZOlQXfEx9bKmZymlYdWDg4zHTZE8wvm+lylHHXEweSRpFqqblVoMLZnfwA6UcKxhPbt72D3WetD79yhRbItY/UmVIRWkdOjqdVLMRW27tqbix09Z8laX5hM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216199; c=relaxed/simple;
	bh=B8gWT6yTtSDGc4x7LRJPQ1QhmLOMEOeP5TcL05gueFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/n6A5/LYYmnZ7NdPF8SvkyHK417MQg6IDcJSQnVNiZaMWJkb51X8Lj7Rw9BA0bW+vph12jAB6fpa1PB+iLvEAnljGEmSFPp5Yuzen8aQeBPxJfJp4A9xCiWHDg2XNx3L3qPL6Nv4rXpFoFI+JVCwjO86Me1cKDbk1E6ITZ0xnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD/9QVwd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD/9QVwd"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3591cc98871so812360a91.3
        for <spacemit@lists.linux.dev>; Fri, 03 Apr 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216198; x=1775820998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASYJwuBhu5a8LjNhoHAH0mC1WnGEKpiV1VXSV5azjak=;
        b=CD/9QVwd9pxmgKL1xy5r9NAIUBOtDrPooGyxWLIxrFyJLbCfyKIlHiZauVt/O4yHhU
         PWEQpT/xV6kVTyKk/ssgyWp+aCgGVw9ABuxV4dYUWIWCbq16cx12NwCinajiMA+7hIaY
         lT++VM5mVYFJVfs+GfjAHxpLTsFPtvZQm0PzVAmaYVx/mWu2OWSnQrahTzimLCShQpMs
         a/L9+7wvqdOLaMBEM02y2QqznBsGlRp1l0c1M5uptdLqKA3e8a6+epVbP/zVxI5ODjk0
         3QzaEoY58YMCr6fjxM74FyO2ISlb4g5vzqb33UolmhINgpoKQuH3WqnISzixNEoTCNG1
         yzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216198; x=1775820998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASYJwuBhu5a8LjNhoHAH0mC1WnGEKpiV1VXSV5azjak=;
        b=V/d3tb9LLletG8Om2iwltNkjxhcJAiPAkUzL1mvXvfcUc8kSmbiK1oBNhYfUD2vikX
         PEbqUpBrIzGJP3Q5LD0WfjwuJxNl/qFu3H7vMzt5tqeYSojvkXa9cldcCwPxLvWENRpV
         JnCnc5g/bqUt2PRfF9tcOFH4uzSKswzbQkeFElwWzmeQTn9e8wITCma6+va0ZsSWdZtb
         MRoJ/oiJ3IuRcDBeIiIfA3yN2kODxnKzIC4wca3fYQtd7Em5A5hOKPE3+uHPdVRXWU6J
         kcDd4HrxlKIGGdGChavnzQhXrESLxKzPi05XhsMpXfgJXSQpLlJGULNOQYrcsjI7auFA
         6Jmg==
X-Forwarded-Encrypted: i=1; AJvYcCVgJfA+E5yCvu4ZG9QRpRmm5gFtfJNHjrJDdnGBSAtL9wM8VJ9USnZM2cNw8xpYxdSSa2dLrGJU/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyExRBcosNzudOB4I2GtMS1QPs1QdF/7jESDtv/iiibNR2fSMnd
	r3pse108lhqQXAg1RkitAlQ09lt9CaZlhVWmziGQy2gFaDyh/pDjjJCr
X-Gm-Gg: AeBDiesKFnAWeEOJTU87AXf81NWpIqe/8z6jYsMXYKO6bz7Ylu2/xDdQeu7e4fR4m07
	ZLfmIWfOXdcyqJmravNB+R3loyKNxnGFKSw4G/T9iFa2e5GTvayMYUWms9ykt2mCK010+3K3g6I
	1PVT5oBaqP7A75Yz2ynChfeoxIY9a2J0BmizN1sUItZ2O+5LIMy4uBcWuMfVVSEy8+hMYaBqJzM
	l6pIWwjoJUtgHdM7WVQif8/ECA5kqS0x+dJ0Z4nD9kw0udD6q6ykNpV4M3OfbKdVdUPVQ2s08zb
	dnOBBF61hTccJ3L++WFJ6fNlqBL58wz/Ab9CpBm8BTOd7+K6fqHu/R+hss+2HqelGZ/YfmP3PQ3
	U3im0m5OrnDmdzmsa8qI92SHMJmXlz4y6NhsWCx9foMOlMFe0pDyIzjeh+OKrKfaV8wWm0M8jWb
	7MJVrimZNcrOBx1a6jHds=
X-Received: by 2002:a17:90b:4b89:b0:35d:a9bd:1ff6 with SMTP id 98e67ed59e1d1-35de695fa86mr2252467a91.23.1775216197136;
        Fri, 03 Apr 2026 04:36:37 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:36:36 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH linux-next v1 0/3]  spacemit: k1-bananapi-f3: Fix the power source of USB3 nodes
Date: Wed, 25 Mar 2026 13:46:07 +0530
Message-ID: <20260325081700.1502-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following changes fix the power source of USB 3 on K1-Bananapi-F3
development board.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)

Use this patch now we can enable USB hub
[2] https://lore.kernel.org/all/20260326100010.3588454-2-amadeus@jmu.edu.cn/

check regulator_summary for more details

$ cat /sys/kernel/debug/regulator/regulator_summary 
 dc_in_12v                        3    2      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc5v0_sys                    3    2      0 unknown  5000mV     0mA  5000mV  5000mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV
    vcc_4v                        1    0      0 unknown  4000mV     0mA  4000mV  4000mV

Thanks
-Anand

Anand Moon (3):
  riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for
    Banana Pi F3
  riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard
    usb and lable
  riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)


base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
-- 
2.53.0

