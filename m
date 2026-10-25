Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917580;
	b=iggygb0SZacuFlIW0z2kQkMIZ/J7bh5WxFmMtZwxjyKlZ7xUOmrT1Mdx3XpL/mdsghRw
	 vUS0MaHGvBsKQbdiYPyKv9GxARGlyurcrZji4+2wr8g6CT48akpuerooOGnwEcW5itO5m
	 q+YCZD1qGinOAoJc9Je2qtgZnYGzROhbgcfyJvVBBphaht9w9XfMMXmC4pjB1b9Xf4fa4
	 mNMuxgbiVFH+C3RtRZGdq5A8JuldO9PIgLZbQ3qG0fqHGXgGdppkfg9wIC2YKFTW3ngZ9
	 t/6Snz3eNhkx6/qc3T1vSOedlwhFn21SXCT6IpFgAsvBac74AlrmFGORiI+Ikea5U9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
	b=Ue7XOdAo32calwYvUIiaLWPAinmHjJjxVg2elK7Bumkiiiynetfp1Ev+pZpK9BtzA+BJ
	 KTfwOUhPsrYotg5HJ6iDAdVKUsbpmqP9ew/+O4HAmLEWlMkbo5UFmHzVXNze0DwQOtdBz
	 +nrJbbV8kdI8a10zvu4aajP30SZVQm9gMTO3QX0ozwyRowrU2greAWH/26V7aDKQgVYac
	 YekoxqPL1MGcBxH7O0K5OfeqI7QAY93XnmQfzn/HE2h+NV/xjy0S4Ohg0Wa6Rk06ea/bA
	 3M/jzKMNJ5VUwnVuiMvlFdr7k3DIhtQ8QuxR+qeejh7mUiU/EDo4dfLu+XMndnlEmQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m9hUdQm5;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDD606A31D
	for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 08:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFDD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m9hUdQm5
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1092201a91.1
        for <spacemit@lists.linux.dev>; Sun, 25 Oct 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792917579; x=1793522379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=m9hUdQm5L6P2X74Q7oF7jX1gsHnlORBnrYM4qNyVqUtZ+NLDGJoeiIG0zoJs0t6E9T
         RpDm4+Eo2GU2uSVhvaCmku6as2aSwuCwS/rzYIQKiEr+yZeQZ8soOySAZZ0jo/0hF1SG
         0zfttmYF/rq+wuaIEornCXWKsgYOQIz2cd3WnK/F/moqAg/R+oveQSipD7TyT47Yb/sV
         aD2ltx1Wlppq/YTQsRWTXYPvx7Q0HFMNfZ0fVhBuVAcc+C3qeJhc7c7ZsJOGOT3NqYAl
         x2Uur5vNFrCEHzKGN13gYdrF7zWhltl69EYXNahkiu34vcOM3KeOT5BghYFYBEPtv/Y9
         VHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917579; x=1793522379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=eXosDg4/Xz3RVyIv6ZwpukBbX7l3+RLu9pzytKE8uIpkt1XQ445IEpLcdpjbO44rrj
         19mZ6WyYVFNoACxMvvySwDIMufx9LHZ3RBshLACJeynZfkQN/22aGi6N/NACeOqyaTtr
         0tEaSf7nThU+iQkn8p/237NijD1XuJHgePzqAcBxHuJlfSYGS7MXgrEuGqpglIgSzzNb
         31ZK6Lou9OtabWUtYkqf+nw912wOigV0kWVYJ6IE9pbjrEH1kQ05sTDzbHT7tz1ETYZM
         aXnuCLqEnQPTUMMecjlN6AZAMyRAEHD8El92fbTe4BivQyvEd22bUISB8yNFvd6YB1TT
         Lb+A==
X-Forwarded-Encrypted: i=1; AKwUvBxV1dMRSL9nlmMI+wYvC/tWmz8C3KTAaxdwoRvFrFl3HJ2yQfpv9QpNtddJvMzd0PA0smgICjNq9g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0dT05fifms8GE2HuDb6eTMBVbktRNJHxyI5Moyu/qBq2E4/yf
	iCm+3UAQ/spK2wBr/2dqmzloZeu1mWoroH/JQHx4vZ9i2fhqTpG4ZhWT
X-Gm-Gg: AYBFou31j1ehiX5srajpkvOaXB5VjvGhGjnSYILIT3VMqAIQJ8cjdaC4yOUzjfqc9EK
	gbWI9NRccYggzB856kZH0MlRs6cK+2nUlyWmenFYnFLUdNbuAWj6/H3JAm/xlc8AFA6jd2LS9Zx
	EkOPi/+YNWcai5klCcS42ruCgpZsbusqoPri2XbFtMmSVr6SAv0BdblRvCia7NbDdYopO9xwIQv
	OARTQ9yH46n8gBsLbCEIkuqqtyzco1TS7jx5tE2LJbYD8b5NCMkyS2moRqC8mlvPCgXFKU/6DPm
	e2jbNtmaiWklgcH16sK+zg0lPXUbFtwDTAvppF7t/Yo8V7lTwU5RZmNMHrYGXc0EZ2fDbrkhyPr
	f6tM7c4GMePcOhs643mk/Dt9+fJ+Lq7F9+MlGYCKaCP7VBpzSI2z277T057vseMKe1AgUKaY2ee
	QJjuuOVmitXmzZAYmdQtyxqR936ymCnFZn2KYk9vi+DkO+OK8Wy3t5wIv8Fj/UvgEme+CLGdu1p
	gtdT5EOGq30Kyd2scVw25eJGFMwBW6x1XqH/AF6a7fDBqZ8rlKt7aYbK8VlczQDu1Rb1qceGQIx
	vqQtCUGQCjY8e/EOHppo1RRtys3Lp07BkiKPgrHcZtKGrszNHahlOboKpbsNXkkZVrXOXAR3FVl
	Ig5sl71AFCkUxVWN7NIk5mGA9YHLubC5bEZ4=
X-Received: by 2002:a17:90b:5906:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adead0bdc7mr3144482a91.37.1792917578985;
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe69478sm4585051a91.3.2026.10.25.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 16:39:31 +0800
Message-ID: <20261025083933.26066-1-alan.tseng.cs@gmail.com>
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

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

