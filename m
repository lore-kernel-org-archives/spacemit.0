Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6776238C0A
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104983; cv=none; b=cjHqE75uPFHMDdVewkHT26wu/e2bI3/hlj9f0o4MDsccj0iNYaP41brEygeEkZpbcRwdv/vY9mf8JJB1Jm+13OWgvCa0TQMNYFGHLGZPdgFhwbKulLESNSHGC+SEM7EXgsckuRXXJbKtdYRBSvF9JoVls1wU0f1obvY2yGVsW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104983; c=relaxed/simple;
	bh=a1J69aM75aks5NKEgsk6GGcoN5bgwi6MKrm7NlrTPLc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hHf80Um4JMGUYfa6XH7OYlK0qXfoja+Vfkpa6Kg5061TkVI2dzTXVwG8jUSNXSkk1m1Gr+7Qe27y2c5BNSw39rj0zkdi6VuubSCLcxrfJ2BEZTKeD26Z+xNTNbEFf1u544YKS7GX8SN5BBvb9mVbjrFnnp2h6Vfi2V2Eu8rHIAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1HpfGBZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1HpfGBZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a1388cdac3so93200575ad.0
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104981; x=1767709781; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxCXRDx0w1yWm9FY0vwmJNFDCxUNTSO4kUQ4eb5iubM=;
        b=E1HpfGBZtsws73w4j5u1vYeiWAYHmt4wctkIy7EYWYJoU3f46XaasYJ2crV76Xgw1D
         ROxPO1kzGkm637fwwm2sKNdEWnE5o1suh4VyRC+tVYjheBDaP82T1FEUC/T5Hq2CSGHa
         cZVLml8nkBT5hcdN0VC59tc1R1k7uRKSuWh8Wk0Vf45h4gK4yYi5Yr5+Coa4eOvrLLgk
         oLkqd+F6MSca7yll1CxM54vMEk6F7E7UkbOZ3W6uBCiMAnn0p+q6rWQaQ2v3aVChrxO2
         w9RTLVSDzU7QHFkd2vQtNxBtqzd6CW1ss/IzXXLGFsTefLYYeSTc97rSkHXDF0GoL90h
         ZGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104981; x=1767709781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxCXRDx0w1yWm9FY0vwmJNFDCxUNTSO4kUQ4eb5iubM=;
        b=pPH5gRtzh8vgJ0eZy83Vkp/c03G6BlHJ+U5EcCkFej8gpqTwIQvXBkiUmvJcQkNEx6
         WjjCEqaTA+gU0f/ECffJIWV7YMM3E4gd75HJBU1jgBhex4QwgVbMEPU80ZhmzIR2MSV1
         4XJRliMgo3IqwadyhXaFyHdsWyTB+aXvSYG302x0jcby9B5YpI1YeUPd/NYINhvxmR1z
         czk5f80grlEwu1yiOI7WBEEYYrTJ48dQAF7J9+nk/nW2S/qnqlJpYGoMaGrOzdYhy3Cd
         x8ybRgu9OL/g1WFrwG2alC6Hy3JJtA9QTse1n97FH9ZWQoDuyqwlxeVlq46l+E5aEMFF
         9fWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM6nbSDyQBHDQrqFrzK8k33TeQQrICXmTKbjOpq7DdZaTInDzCpOMruhwI4PW9QcT7rekn82SPOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmogcqgFxBXEWxQ7nN2Li1ss/WiLQcr8/k9oOHEtNc0jwkmaIg
	4UtyDNIM5YK+kyOaWHjBRTurm6eC+ASq7IvTVUgWt9sR5HLLwq5kIcDv
X-Gm-Gg: AY/fxX7xs1pQzNUtxBJmBwnbcT5/GCbSI9cCyQY1KSjNJBhaCXRPJ5WIuJAOdz3IdoZ
	O41jpz2r1xslFN2cp7N/+EvlplxHw7qF9fWjI97FQl63ZFvASQ/A3IjwU/I2S2xoQtjVRNYDjlR
	cVXlXg+EFKfxORjN9PaFX3BroR4XFk6EOTEL1nEOM5fATmvQlqe2KedoBVB1UMNPjL8QsF+LQfF
	eBUOKlMYORFEzPIkOTSj9cPdRLBm9zzRFUKB4SFrRkMaxas4oj41yi2/Bc1OAo0/XlGx2NJclxK
	M6baILhHpqnx60fXFFgWqYkcv73kawzBF0wcr2wLBK9VIIgW2D5tPcwL1Bng+66y5tubZE7o0cL
	rBAmJ+zXFkSKwVKyKwOwtFO0l/hl3QRsKuRJNunC3rs0vpmxnC5+3HttUQKRPjhmJ/PnVYjbOuB
	dJWXUMmu7sYL6yEDo=
X-Google-Smtp-Source: AGHT+IEuziUm5FuVFOLapyO93nCQfCb40IgI2Or9ENPDmWDsqW88deWU184+w+hKs3Tyi+48xUtmng==
X-Received: by 2002:a17:902:f607:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a2f2717b88mr314299295ad.26.1767104980514;
        Tue, 30 Dec 2025 06:29:40 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm298183155ad.8.2025.12.30.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:40 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH v3 0/3] i2c: spacemit: add reset support
Date: Tue, 30 Dec 2025 22:29:01 +0800
Message-Id: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3hU2kC/03MywrCMBCF4Vcps3Ykmai1rnwP6SImYztgLyQlK
 CXvbiwILv/D4VshchCOcKlWCJwkyjSWMLsKXG/HjlF8aSBFR036jEIOA0de0NZ31qYhbTxD+c+
 BH/LarFtbupe4TOG90Ym+609p/pREqNB6UtqeFHF9uHaDlefeTQO0OecPQOy0fKIAAAA=
X-Change-ID: 20251218-i2c-reset-a7be139213de
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767104943; l=1371;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=a1J69aM75aks5NKEgsk6GGcoN5bgwi6MKrm7NlrTPLc=;
 b=18EDF1Yo3gil3UtsnPjnP04wMrhNkhNbTfRqJtMQTnJdkoA05tCeC3CideDM+jpKg5I8J2niZ
 Bu9piLwlLabC0cfTZuCfH/4VcODZZNdWNjER3S6w/QX91MM1paamAdS
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset support for the K1 I2C driver. A reset ensures that the
controller starts in a clean and known state.

Reset ensures that the I2C hardware is in a clean state. We cannot assume
that no program used I2C before the kernel booted.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Changes in v3:
- Move reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v2: https://lore.kernel.org/r/20251219-i2c-reset-v2-0-ad201a602e74@gmail.com

Changes in v2:
- Replace reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com

---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       | 8 ++++++++
 drivers/i2c/busses/i2c-k1.c                                | 7 +++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-i2c-reset-a7be139213de

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>

