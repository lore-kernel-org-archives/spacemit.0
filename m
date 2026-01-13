Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7E30F95F
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290376; cv=none; b=KeJrlH6RpkU+Vep2vkNG8s2+IkRV8J/IUy/VQPIrCxet3jyhW7gpxOMJAQC+KGPsn4/PI+wiZ5RAWkRe4vRyIW/uwdlljJQMx2NQjt6DmDccL15RpX6P3DPh5YgNWk9j29cww3Qboimh+pmNvU7yE1isaiF339BsGJ56lZxUBV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290376; c=relaxed/simple;
	bh=G/wZDvuQOJ/sIgMSogrhCI0LOUdTTDMoWlE7v4CDGBw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iOBowvrUj9IVGNW0ONBsd6iN+X2AbpKo2twwnPnbITlM5Cgm1Mm+O5gmGLDz+dnnRD66OHtuDbXPwcb/XRbZ9U6HZaDmz1DhP/mGDeELyPJK1hVkftCQRE8CAWwOYGBNq+eivJLv2Fp8JLG1j2MB3Ro3+GYMr4VKXHDSqrPDwuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1ytSTmzf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1ytSTmzf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso64479365ad.2
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 23:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290371; x=1768895171; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVxSFr5roBVYFLRhnAgNNp/8sMao7GowEf9CUckDDWw=;
        b=1ytSTmzfUwtjm/zX7+r50DBqAtmxuEUsB4CLFOSZvkOaya5jHEPOSmfqXlA3DEFVjZ
         2c6NlpizmFjeCvSRCNg/dXaWvFyD0LVkvYdp3f7eKqqgrfs9WLvk+4GZh7cPpzVNOZwU
         WXdobyf59JW7MKDBv9mCruU1t22ekxKthFl/IM//eU31wIvocxbxyQKbRCtsHCJFwxe2
         YfmbqFX7f4rr3rSG1yh81xWZYO4ZzExJOiMufK3KaFKabuzi40T3hCD9TIp1MmFfGz3I
         MVg554w07cYnBdxYHRUxquXdx0seDrLUuSovGL8JIIGou6bw69SXgqYI7KVfQY3x8BdO
         ornA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290371; x=1768895171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVxSFr5roBVYFLRhnAgNNp/8sMao7GowEf9CUckDDWw=;
        b=GyFU9uJHCFUplVG206+El1jEjaJ5BI/UnnSdwCU7csER8eueiRoapdVdZw5D3JPy5Z
         yTKtc0de+1SYngfe2k1wU9jaNRDsbtVzG+sgFzHZwIjykFm3cZqZjLpbZzXYNDr2p29a
         AA2M4IiHyYhomoHxTS0sfBWlnIJjnKuVpFT/BqzSLGJDYngu4dQVAjiXDT9QASmkbCXX
         bAQhOceq7nY+oRZOvyLGjl6h8Udo6TtmPc6HAy/Fm0GmvNWaVLup7pMvgHzlm2aLzIL0
         cT3CQzqYg1mxooCJBOhxkgkv1I//r+Q82M6udFNJK1H6j6V3hG3sQoaL47COCIIVHyWm
         a8bA==
X-Forwarded-Encrypted: i=1; AJvYcCWKz1H+l1KoOrfSqEwdkburj7yYdgYK2OsLQLUK9egn92NPwaqfTUJeMFLrHr48YiRjYonkHlIfkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMIo2waZmIyn26hPgsLX4IDPph26nnquvzL+ybWhKv6GJmTLKy
	VdynIb/a+4abec1qCD7sZv1jD0faqOxoryNEZNWPd/gEAqg7pusSmCxQBjJTTijefxU=
X-Gm-Gg: AY/fxX7HFJ0nvh/eFIRR7XZ850cl8CGt58XovQjjBj9aiRAsEnfHw/C4BuNCo1KfNIh
	TXLSd0wnPQn1mpTL5uMX2CnJIqO6doqXCW8hP6pn52VLMCRvx/bE8Wj1/nn+bBdi5Kfv8/nn0AC
	xREqqBgiUyxYU3exkqTRNADDkBRUdDUtIZaML2DIEDW0LRHBH71BcQSrTOND1DLrKbnhF6McNOF
	JbzRfj1fr31hXgdbwX5plCaC0dER65go9k8oOSNjifE9KZz7cfCqDTVvFQrV47I3zmQmqIiYee7
	MRVvNtwMz0TB07b6G1TZeIoxpen+6QSkAyezXZadhzmLOngKVlFVAy33J/04RGv7Xxt0HvGiaMw
	he59OSqFRU6JYl5DQUW92OXmlq72iJdMGLn6/YV+cFCaUJI4Z91ZO35f7GR5mfyNqCuyC40LoEE
	Yv48KeBffsn3rqziJpVMNwoaFRDEBxy5PFizoIULVzNa5RkO1M1MQewg==
X-Google-Smtp-Source: AGHT+IHbHcGmc6lMn+EQWcpZEtvrjvUz6htmK3Tb0lxfDS12q7Bh+oS5FfObSwVuTxLhekVSu4CkJg==
X-Received: by 2002:a17:903:1a6b:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a3ee41516dmr200714135ad.1.1768290371623;
        Mon, 12 Jan 2026 23:46:11 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Date: Tue, 13 Jan 2026 15:45:52 +0800
Message-Id: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADD4ZWkC/y3NwQ6CMAyA4VchO1uzMRQhxvgehsNgHTaGoeskJ
 oR3d4LHv2m/zoIxELKos1kEnIhp9CnULhPd3fgegWxqkcv8KJXSYKwl30MLNjKBKk6lKg5aO1m
 KdPMM6Oizerdm64Cvd2LjNhQDMpuVrbPzX5Xw0NAapi6pMBUgwRZV7rTR0jlzDcQdRxP23Thcf
 m/SLkKKgWKdefxE2CRZiWZZvrj2++7VAAAA
X-Change-ID: 20260113-adding-b-dtsi-148714533f07
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
much later than its component extensions zba/zbb/zbs (June 2021). Recent
updates to the device tree bindings [2] enforce that when all three
component extensions are present, "b" must also be specified. Related
discussion can also be found in [1].

Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
It is a trivial update, but can help readers reference the correct
document version.

Patch 2 adds "b" after "c" in 3 device tree files (anlogic, sophgo and
spacemit), fixing the related dtbs_check warnings.

This patchset is based on top of linux-next, tag: next-20260109, and
depends on [2].

Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/ [1]
Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [2]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (2):
      Documentation: riscv: uabi: Clarify ISA spec version for canonical order
      riscv: dts: Add "b" ISA extension to existing devicetrees

 Documentation/arch/riscv/uabi.rst           |   4 +-
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 4 files changed, 150 insertions(+), 147 deletions(-)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260113-adding-b-dtsi-148714533f07
prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

