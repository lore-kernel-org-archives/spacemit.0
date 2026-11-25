Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570739;
	b=FuNiXwgROXu+77e9JFfnqK36aVkICCHT4e8CtMiAo19FcRAFpC55iYQjtnmgv7xYRCrq
	 6oJ6u6bhulDxIpT0FWuYDHyg+yi9A2o2TGv/WlVTVyL+Yy0zN9i8OLIxbeM01nMWG2ADP
	 V9PA/6COJEM+NNXydKXfHxVWPMgyX2p6rBofnkbUL+VDzTMZFVvOwGVah2zZIuQ5rSDdy
	 ErNYkyNDsrAaH+z6X5zTdMqxO1MaxwDWFAskY08lxQh61xMOIpDOUxY7UgHxegirPXSWT
	 Q7WuRO1pYshCFT4WForhIi1ZTTlsm3goZbP1tBqTvOQfOGtiup/zVMFG8uDBzBm1mWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570739;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=Z5NvmDfoOMh8nWvdrDVFy+6gwXUkjwkZJi8F1o7NcSA=;
	b=VejEibzFbIespVksLN4tVyRZWCktgIulCFl59Q4I1vIjMl801+pX0/3MAWrzyPwaU10V
	 Ekh7og6A8ox0bP0MucNF0o7U1j8yypv0ZsA4O6l/uFkF9l9geaHLIG7Tm0lS0lreFrwra
	 l91urAQG6JaDE7gjGyoF7ZQiKhzYzA4oTDi6evPM2r2jPgzqd66xBEEOoamhpUeqSZaZ1
	 pKZw1KHhIclDaArh9I9FtjO5Jbnv2H/UA+BPiTeV4vvzgMBxZJiYGEnv2hWNAgTH/gJyT
	 ly6j5/x1XGsyf9OWai2u7FsJ6NX6RS3SGKMNlfnJG7tFlkKAsWVi7Fq52URCDe9Jteg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=H9SoAKsb;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609B606A332
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9609B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=H9SoAKsb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570715;
	bh=Z5NvmDfoOMh8nWvdrDVFy+6gwXUkjwkZJi8F1o7NcSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=H9SoAKsbfgmnqQojp1je3aWPSAnKANkYuC+TWH1Zv4XbB/Tk9fbnzHEaCJ6g3g1Gn
	 cpcuAWSAm8CndjB2QtS0vtBkgnJz1e2Rp0K0cNR3IwIW/7SViT8GamABblcHzOUoDI
	 j6/S/kO0Y/LkN564peXk0bO7mRPOYKWv4WMHK/hg=
X-QQ-mid: esmtpsz17t1795570713ta358a06e
X-QQ-Originating-IP: 7nEOW7i3Kyhwc+ETQLBoqO76AJdyJ5JmFW8JFTW47Ik=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5425572140736427969
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
Date: Wed, 25 Nov 2026 01:38:19 +0000
Message-Id: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywqDMBBFf0WybiQZNWpX/Y/ShSZjnVKNJCoW8
 d/rg0IXLi+ce87MPDpCz67BzByO5Mm264guAdN10T6Rk1k3AwFKCplz3xUaG+q5t5r31KDjujB
 VJLLMQKbYeuwcVjTt0vvj2H4oX6j7zbQRNfneus9eHeXGHQEporPAKLngkUoBYpCmVHh7UztM4
 Q8NtW3YVhrhzyXTUxesrhxUbAQWaZokp65lWb6maOhuGwEAAA==
X-Change-ID: 20261019-spacemit-soc-timer-cadf3088d286
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=z4UmabJALYVuqfx9tXza0VVqatCCYFgC19fmlWlxTfI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqL3lxr33n8sYT+5uHC+vckSDjHbq8a9U0pWeGVw/
 bnPWDa3o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCK56gx/Bebxq4XmNNYlM3as
 9z0f9L29Z05ctuf194f6hY2Ee9IyGP7KmV1fyvtr2aL6taJrYm9uWqd1bt7upaoB4fcmH9KaKR7
 MDQA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MYQNnnlvmY00f1yMc2/KR8kw6oQZDV+VgxDCGN2Y0O2S3ISveEMN0bb5
	FCHszBpxoGcAmLSIOxdt2FTR1EfePjxNstuGFXt1m/adR2wERoGNTR2/+UBpQ0gfU3YTHTh
	a6t2tpjIKDPpQC97CZ2GgZMku7XQ/2pxUtaqzaTM+aw1TIJmubo9RssaxDp/uj49Uca2lJr
	Xr28f9IHui97mcmwEYYOlBzmsG57Q+pxBD80lBg73cfMO5cB0diiBAuLj56JV/SUZRilcYs
	OcaYDXrhgsGbQtJ8WB+RHC55AeaecEiKcH7e+nzB7QZquB3RUIYwulM6ggQMMZJ5bbtiAVD
	CUcHuklO0yAqzFsc7v+VZEGKwZsw4noVt5YReHNW/0yvis4igHhuXQof+cfXkCkhk7/zBK0
	d0AmxgLH/IRPgchbVX2CqIJ8/XQRSDdtIpNl4qJPG8R34eztn5GqGJa7y+U4NEOFmoceTv/
	RCkvNgx1ohvGBviqyB9L3Brr+F1PXPyx/3F8FkuQb1Dc8m6/Gfvml29j4MTjFfzR3QOonxm
	LaXcSMSobKTYoQ4xhHqjHg9YWEL+ejCcSc6d9W0GjiWatuHdZcMtADkueJf2vj4o8+tN65R
	krQzq9zjqCz2Faq5KfuhNbDp8IYumF3ZiVGGjyioGzII8aQuBbYJCPguAvmtOkfqWsvVrjV
	GO1jDcGH9OmNq7y1oMJ2RsD5RLc65V2TBDSaKUwPfcexX5/mcIIBzS58FNAafoVOb4dB8yk
	vHZPNKRJwyNBcc3vaP5n7CXDRv9mIdmJ19mWN4RU8hs0+6rD8amePvYNdt6dv9fvppkYGOM
	0eYusVZKQYdKgFCkOUO72Kkf2mCXClYParxh12ejxBz7ypBP8cfeWj7vNh73xDWvuhZ7CvG
	XPE6wc41O7wxcxpVQrUrpHhINqSxSLM4ao4R9CkI8BNBdwlfnhGgvVg5/ll1nV4LrlGcp8G
	LjeWgY53B3AM5biXO5AZojmTarbXVSNyiCzeZjpzK1xhHxyJ623PZ5wZmEWh5zRl/i5GeD3
	zLYGkuq3Wbq62LZYbGehuVvAX6n8ssPAPuW2KLboKxL7Ndom7oHA2/S/Wms9trcEwvV8eSR
	f4VRSjBdjOZ1iosANEi+KfH4VN4O9by7uKSPcuRn/OYcEfAl/WBunTDm5Tks4vs8iMoU+yQ
	iGPxsCadXnKiDMs=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 and K3 SoCs have APB timers that run independently of
the CPU cores. Each timer block has three 32-bit up counters, and each
counter has three match comparators and its own interrupt. A counter
can be clocked from the functional clock or from the 32.768 kHz clock,
and can run in free-running or periodic mode.

This series uses counter 0 as a oneshot clockevent. It is registered
for tick broadcast, so it can wake up CPUs whose local RISC-V timer
stops in idle.

K3 uses the same register interface as K1 and falls back to the K1
compatible. Both SoCs run the timer from a 1 MHz functional clock.

---
Changes in v3:
- Drop the unnecessary RESET_CONTROLLER dependency (Philipp)
- Link to v2: https://patch.msgid.link/20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com

Changes in v2:
- Use named constants with comments for the counter sync latency and
  the minimum clock rate (Iker)
- Link to v1: https://patch.msgid.link/20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com

To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev

---
Troy Mitchell (5):
      dt-bindings: timer: Add SpacemiT K1 timer
      clocksource/drivers/spacemit: Add K1 timer support
      riscv: dts: spacemit: Add the K1 APB timer
      riscv: dts: spacemit: Add the K3 APB timer
      MAINTAINERS: Add entry for SpacemiT timer

 .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
 MAINTAINERS                                        |   6 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-spacemit.c               | 317 +++++++++++++++++++++
 7 files changed, 430 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261019-spacemit-soc-timer-cadf3088d286

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

