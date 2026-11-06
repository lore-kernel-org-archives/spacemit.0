Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945218;
	b=mlxq0cD9RXqXS9KqF/6Meaa647n3RUr3N1A4m9/f0IPEzZTIc99Yoq5jnYphKwfuoKjf
	 Oh0xJpUz/wnZvvV8WZRgOAW/NTFV8apK1jz7FfvL/4Oi2OciabBuK2aOoqwE+9YLLn/Py
	 B94l37C5y67V37fgN1v2qNsnMsdnnzoprihmtEHYpGnseju5VYEPvw/TLUHBl4PYfhq+Z
	 oTqpuDZ7RhUKRZXJnedd2RVx47rO77aDSdUOevyA5RSuSXfKO1CscORzd4/9V6r8E66Ne
	 3wQ1g7iEEEmKmEQ+1Upfcb3Hf+M4ePQpkQ3pFrE10MR7Lyk5pIttWceVWhNnBE1h7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
	b=JxQZfd3L6+3j9rU7ZycNsdVaUFbUMTtW67xEoHumBXJ8Cz3fdVmF6nyBzh+6emx4kQts
	 uDaj8ZHzpBZLjkFOBhq+VJs+axf+GceE8BQKW6n9Vu3zEwB6+EnIVFay2aOsq0zF5CkIF
	 b8LI3en2qw4PSA++nxbBrvDbOaD3647QtzTI7Ve1MSVTMOiyYPVd+mSsFe8mW8pAHp0da
	 IB711fjldKVIA69XKcz2/Zj8DyQJmXpEngLK8R5CyM5SSvHx9Uu8kv0MdZfV/NZ2V6WDW
	 24TQOxWtJGS/IcVwVJt5/hyEUMd7ndst1GWfaI0Ee44eip1/TRKS4Ky1pVEe/nkKwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etJogwLo;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F0606A329
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 06:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2F0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etJogwLo
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so593600eec.1
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 22:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945218; x=1794550018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=etJogwLo5sCzt4S1ou69rEjxJtNsevn/EQay9QVp8cZXFQDTDCiFfiS6/ygzXKYUMC
         D1TBZrOMpkGTnMepeA3xR7ndk8ZwJlUR+TokqrWlUPmHhSpQ7JFBgaTtqKW5tTZt1Sg5
         6aYpLSJkC9jUOZYa4rH451G5HlmBM17ZGDQJdaM7BNGzbikArVTBccuR3BTgyc0FyzTH
         O9nffbXRZ49OE7fgphi5tQxGJM0r71qABW92XZQwLFx2HXC4RiKJw35TP6TYVCxw5Xr6
         nTRVqByQYjOAvdjDvL7gGRwBopuHvPlLaYnvZeRdyYohyF+koXaIo/AtbnHxcAmq82qV
         Kp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945218; x=1794550018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=LlvZQ9eSZiCDPM5M7I2gs0kopdEs/ghGDn7mkSs/T8zAap5ty2gU7FYhmIbcy50aMi
         JMEq1gJ+lFhpOwWrqFMfgDYbeDWmfAKBbaOLHIeZwpwgePvmtcM7t1eHmoqyaN8i8+nO
         zIQl/E4PkltmciMqauaiBjCBM3QJFfuozog8hA+oLhowcblpurH49pgsvmeok/JEbuyx
         5qiJErp8hawaJ8lSbsoZ5U0kxr158C5quOm88feyiNpezol3mDLMhUUYuU5/AuyvdA8I
         RvnzWOoP5n1nQ159Uds32bOkGTvhEiCAi2wPmgLcBey3IMg0c5wHmHCXtazZ1YToIXIR
         kWqg==
X-Forwarded-Encrypted: i=1; AKwUvBxqJzf+iKp3EwIB9Wa/3dpJw6+P7nA7TRyNahTnT14oDIGk3Jr0WthHVhFttWin0GE6gj9ISQZOGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yikcFzm+CUR6PGMvUCK0lZswud+yCgP0VuPWWjPqUK3nCcL/W
	ZLv7jEstzl2tAuf/yRf7piDGF7jGWb9ygr7I3iuCDwyCiJ51sUwNmR3m
X-Gm-Gg: AYBFou2u4ciNN2C3CMTy8eytfHBdMu19rpA7kFNujDIJ/f1YGjqtNeEXuzc1K7vuaFb
	2AeTDGXAn1y0BBGJk1wjx5FRlt1RUpBrS9ur2pgrNp3/83/b2vrkDYXglVatMk3SFrzTzdDVwsh
	0KGijr/CINsMAH50+piJQEHMqClQaXucMFcMj8+PUPFcCiY+uhLlq2oOHWYNL8Ybt8fW80UiBcu
	C7LZIutsU/nNa29uO13+IdmAuZDOvKseWnBMZVlLl8NB5zaQ3K5h3SE740y6ubszaMxF0LfCrrC
	Z/H8ZOXUeQCuZsAVXBf+Koft5KKuqhPRS58qDvFJB+QKNRquCBl95rAwE1JAcGsP6pz1rDIXdMm
	L8cOU/Wk+zgDZr87SDbe2bN1bQXM0EQvmdSEQGYwQroB3sRHHv3BLAgez2DdXnVjIjphpyDty13
	LZEc2cf+RAg3DNlTW0pH5iUc//tsrSGWCT/TpSc6gB7xk4D24tfsAjoh1HDpaCbhLOWIonw01Cw
	Qa3CQja3ET1a/IRltHGJyI3MlGbGSN4QV66sxNaSopJeItz5xUShDqfXPg0YhtHxhERmnx3vJu+
	n7prFgax+2fZHUQqKR4pBEi1O0kfc+E83943tJOslaQM4BBYsmU7
X-Received: by 2002:a05:7022:3b83:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b25d34ed54mr1914086c88.47.1793945217607;
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 0/3] Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:22 +0800
Message-ID: <20261106060525.346873-1-duge1256@gmail.com>
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

The driver reads the shadow registers of bank 0 and bank 7 once during
initialization and keeps a copy in memory. Later NVMEM reads return data
from this copy without accessing the registers again. Reads outside the
two bank ranges return zeros.

Tested on a SpacemiT K3 COM260 Kit by reading both banks through the
NVMEM sysfs interface. The data was unchanged across a reset and a full
power cycle. Reads crossing a bank boundary returned the expected bank
bytes and zeros in the keepout region.

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  25 +++
 drivers/nvmem/Kconfig                         |  14 ++
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 151 ++++++++++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

