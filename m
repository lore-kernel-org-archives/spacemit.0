Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580147;
	b=UwCARO00oi/QL/FdlzjdnrBhHBmuvEhFBppdo2YUXXasP5yhxflz8udTh+PowkfUuBKi
	 RYcmT+gOvZQLL8wWYtiQSBDQLiOl36xVCRnZsvXE6IneyktYqWroT69vhe97q4bgQ7U8b
	 g5xs3+C4AqRj12dszeA73ZtIuiIb74iveXkGHgkZm8M0kh+Ia01Z3OibxRctWje7PqVEA
	 l4GBdPTO8Qa4QeFqm8h3iWBoryJUWF8ulym11AfTLc6/2Rw2MPk5au+xGuZZcq9He44fS
	 b5hhkxFsvqW3DvszEQNf12ffSN5JifC+t652S9G/rqqKj8g0DZUODM9V+lpfsl6+kMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
	b=BusxEZ7fdq05I9kjtwlazf81wBhDczRCxsAizRpvz7VQH6lvNVQsy9mgNeHln2B6hQFF
	 uF+8p24I+M6HOU0cWl0K3hrV+RovSJ5l2VfC5gjmD4Vu7huSkiO+EaS1AMQPGi35ocZFW
	 Y423t+R7D61gUz5nxlMJVE24EOLjgyFFhlbc2h63RsWh/zOC6OtRQUNscvDNghNy9kxVc
	 2Bfs6ZXofOmYHeqXgAeOadUjXLfs0e2c9+j6oV2/+ruT7ss1TY6NlmOjy/Xp9TinTUqNS
	 bRafZew/KIBnsHH5ggUy+oGLYrEdsJidB+pLg3M7Fjt71vMkNQP5O/aNRNvRP/PQoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN2l5EUg;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F7606A332
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 04:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B16F7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN2l5EUg
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2755997b3a.2
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580146; x=1796184946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=oN2l5EUgdgDnDoWw0Zzw04g7ZvP9va076a5hptpVE+1ktVwFsRrA/6kHEEPfUZ3x48
         U+FnPSLEcESKv6AH60W6xmBNGv+nbdlY4820ZopMdq3MWm6nMIA4gN9iVZeMsQKzM+3G
         m1nKFTupOh8UF1caYDKAkgY5A5f3jirH3/th8Fqj/fxGrt36tyWs6twwmcsW3HKKHWhO
         UmUoo+7WnJ3n+eYddRttRbaEOcP71lliKzz1ErDCivy4TyiwGDpaQfnNadh6QTpIl8hw
         2tnYv78NWDdl2oSQvUaKVVE9P34rdAGotdEL04sMO9un7cMs+kxChXXEFTqJbxx9q0a3
         MO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580146; x=1796184946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=Fed2yKMf+NtjWXI4/IZm0oEDK9rsc/SzMpApakxNzpBTEBDVaoxWAneeMQOGgZpnBC
         jcfO7L4TjPisHPPnoFZcJPvUNPoTdqQobDcYItx1z2k8crbWRNwf7gHgTOe7pxpXmYRG
         oJFmUdGA7ehctSkQlD6yGBMhxJfSAk8J3P4MYFDlDfGrzoegcxhsO+Pu+hIHUy944ofm
         ypDdRwZbJoIe7VP7RaYzE/wG188JvKYl7kMLVhmn2B+ObjU5Mf0bwHnomPIeNwaEVcld
         nMtr4JDfTg5fZHx504ro1QXPdtyrhaEJAiupj5z1V/pvJ0CLfQ6e+rE7kWHrXCUhZ7ow
         o5Hg==
X-Forwarded-Encrypted: i=1; AL+hErEWzMkQ9qQ5NLObY/dTzhX7LJHNrRVlzDSLHFC1G420A2Z/kQwMc/S/PqzFXjv8lPF/WqjncA+ISw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/eEwrPzuEzsQQ04MswPljFdVqm31+JXjC/DtoVmC/o+u+AdvBZ
	lFRhUoqSWZwId9gQA5vcqiKCvK8mpMzCFdN521C78yF1zdxvMqVSfvWG
X-Gm-Gg: AZFdTZfXPHQZpZKW+47CdKDiqcvOhIJDHj5GM0UxxVOHEDaSX4quXqXvXuQEhgH7GGV
	JcR/q1MK+jqfdLovUGw9u5HwK9dkmlma+r0uOcEUoh71x/UP86cMKYftdd/TR8t2j0ygO1WYDtN
	Se1kFFszERFN5Nx/KLcAVe0ebxp+XRvLLkOZSgzivISLNotXL4hMnZaoYiOuZg4KPONrn4aJDn2
	NaAKc831fkIIQn2RcNIF4VSIooGZD5WF2mAqkVZeZTQplFQiUThnf7UEGc/TwD35f++YQHnyZDq
	QKmlD50WufRB3ZlK2VNaX7HSlQu4PdFd2wJG+s0RtzDOnHISPJjjZEmqN/kEpYseLZ7UMQrodxB
	PaGkVBRE2ULuAv9ayiHAPz/OwRi1RUm8WnIUGdH4fKxU3QVV83J2Z+ZMv7MaFMwoyAOmt/ZkcFm
	To+rZ1BUw1/jriny5vMn09IRiL82ZANRyLwnrOccSZFDekT1STVfMTAgRO7M5B8qk3robey7cPI
	4BuOVmgCj3k4PTtysTnNEAimoPrvriDc3xLrfd1Sa+MCJiRlDzaYvOYzU+ptM4beXjzHRBfp4Jp
	SZHt0e+wIQ4V+R6SfPDDY9HiQus=
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-4014c94a7a3mr16524789637.16.1795580145986;
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm8306084b3a.19.2026.11.24.20.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 25 Nov 2026 12:15:18 +0800
Message-ID: <20261125041523.242588-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.56.1

