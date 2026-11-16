Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815704;
	b=HxmNRHe1dhE6hpkIkACDxZLlPSvfS0mAJcx7TcABcnDYsW0TwBHKBx7unCoTomd4OlWl
	 mcjDkC1fH7FyOk/RNkIIBAuYB5C6/Bkkklz1MgaDtdEi75Unlecq+o2gJlwzT+djCUa4d
	 7kikwdWCe4WTLamRA9AKp6ZmfdVM/kqMZbYRxqmTTE2iQuWxnBAxbm/DYaBxd9yRxCjUM
	 UYgCp/9nqx2BImpWaCyJaxFjQcTJuNNAHGXOmuTJE2h+qBKW5jzSOaMAKl7ViMxCO92Be
	 lIDRtAeRR7LhmEiGI0c66b965p0wAzJlP6kiJaukWgdHzCtTsrPn1xQf8aEDMHwtZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
	b=KvmTKNOhRT1PvnmZPrmuuvT7y+Z1QvvboZp0cfdqrdDTs99yECvsxk66wi6lIvVfV5tl
	 lWr9ZzIkBP8itl/faeW2Dhl4Cxcuh2/Y/xBpKbWfV3baalHWTATw4il35jALJHWC+B3qJ
	 Hwhpmh17ZJfSZEPwWd4jZInf6zQ5NTnEdTwaKyTxduAxz15bT6kTNYBRbXqWF88jKDQnY
	 BruEk7k9ppbcbpSw5KtDRiKWqyxu2roinUfwrRyGZ21YR1qR2WmhlqxXom0Rk6UCzz1lM
	 EFlHtvFccrDew6KWqH0iSj0ulJq5N3hDdkFRou3pusDj2Z3Mp4z/nYzU4prc/yCq6wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoL0id4L;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CD606A323
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 07:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoL0id4L
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3776937eec.0
        for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815703; x=1795420503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=DoL0id4LiLpw58WOJCqEQi/hR9zd0Enrw7bhpJhDit0hNn2u5DhgMCmum27W+P1BUJ
         THsh9WszM7inHkKrChOO+0yjP3Z0eeLCDZmxOHeqQx2tNHTGuYE++vL21LXMfWP108OT
         uCR++BPDtN8ayPfSETJg4XEFNbI7mHzASf8cG73n+kEOk9UChdWVjPWCVNTi359+M4sk
         cGbvhQPwhnHkn+pmoIvi7XT7DXa/1UrOf54GUYOArqW6bYz+GL77TKlqygkjQQJeHG6U
         PoZwa05WqL6KSuNAQAgH4GUISkNwUJyEBoBK2b9iyfe7eeQ1hkOfoSmCQFw2xRU/UehT
         ZQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815703; x=1795420503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=MP7S/CZMjXhnIGE64Kepw3Nw91L26L9EggIWQmzs+/k52FhfeMXignlY3pvTs7xcpY
         jEVnIIuU0zKDu2lihIupUQEykJk0Da/fJJh9ycI2+xUQ6GefVAksQf5owU8eceq56Loh
         rtTgQ1hQvzn+HuH0hQK8eJYfuQOp440o/yayn4CNW2EbqE4aKEMZhqt8ZVNLRBmz+bUy
         n7e9nAEqCGpBl+P9fL3qhavUTQtBrjyrnktnuDlDdcw5nJtlGQq/fcqSjqo/JmgTEwwn
         KJ3mCi+26L/mPVo1pg2lqxu6OlOTJH3Ru2Qg0zPz47Q8ACAjCc2g4WElMHpZZjZyC3/j
         fO6A==
X-Forwarded-Encrypted: i=1; AL+hErFCLa1aQwo+I2jIdscsmBdKQM6MWMFzQgwoN4OEujiyzC4X/k/LqrVbMYYykSwQb2jt+W21wzW/YQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+mJFQFK0qYXxA7sbSdJiFZQHT9/RxF0Qz1WpTWheN8evjg/61V
	pgOKDDEc9jamaS4a1JyzvOl/ZLOyZulxt12jvhyK/YSDncmUha/FCwBt
X-Gm-Gg: AYBFou1PB1yo4VD1rhRKxbmMv7kBld47Bp+k5SwXF4KfUSDX2opPucUprgeZUMnhSC+
	+PLN4ps7fbzZBjJ/DzrDxCmYLIoqiMs9CKC1OVgRo1KZXcdPZLbt1VMWE2GtyRWCdnVARDUf08I
	b73+LAdJ0esjJ7vMuBwE2swGA8YXNy+PvTOAi6tS5kJwnSTrDhWFlsWFQwdyYsrTI5Jwyt5NUWf
	/RmZ7ipi3dOChCUMOCSQ1Mprc6HAJTyPw/+7nmNGa6Cfwpwg+nARzlr9Rv/JC/m6/VcYAg08dQe
	QixFKFfdS6JQim9pNDd5QRsCaTLYsfix445Q0B+fu+dqWCfarD2+FhHLWEB9gf/q7t6KViEfGhq
	6jzOqOBQawJoHkdulleWo4zTztGSultg+eWbyJ1Q0HB117kXnJEG7lCu0cMndK3RZvYmU4pmOqq
	Nxk6OxjrHv+4gtHLRzkeLShv7VIhKfReePZyp3KqYqbDnv7X0FHl3tcdzXx6SQVtEKRGk//NCwf
	cVdKFutQpkEQ/Qt3ntsaR3THIQKuME2kUZxTw1vipTFIG86A4AjkLP2WZkD9Y46fs7ZgxcrAkhG
	axKW3Ug5kzZ4e+dcs1DtZVNRDQyUKfuYn6tdaeswBefJH6aA4t0J
X-Received: by 2002:a05:7300:d584:b0:378:a35b:9e1c with SMTP id 5a478bee46e88-379684afa4cmr9309155eec.37.1794815702636;
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 16 Nov 2026 15:54:20 +0800
Message-ID: <20261116075423.1519438-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit: shadow reload completed successfully,
and reads of both banks matched v1. Repeated reads and reads crossing
bank/keepout boundaries returned the expected data.

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 199 ++++++++++++++++++
 6 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

