Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631523E330
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 01:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200792; cv=none; b=egh+al6bdEuhY6R7O3PNx/Q4LXwT+gCFhW969RckhPAl99OZZBuLLrBnvj+/AP3GCWRwGeP81fJqGx+htOUR7LPuERZ2KVbaoad91EfOeUrmXHrAcrdl8JNDHqIYi3ZAffwCWB+qn6lMlxf+EcPUKEQAbZItHi3nl9VWxq9QMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200792; c=relaxed/simple;
	bh=grRmr/IgtOJxFTSYyvwCbEf3PcoMpkHkiX+0Xi39IYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FB78kKvM9lwGU0zWxCA1NTnp1jwEbWYiebH5sH7hEuhY0OYXHqSART6n8yjIrA8nvMoI3eYwJg3ri0JIR/lcIJ4P2F2C/NHwKSMsbb2mvQrrwN3Deda3aBUtQawGHn2xxf/WQM+OS7pPpf58Iv2K0K8nqoX0THcahbuM5SUCeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jFASUZ5o; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jFASUZ5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785200726;
	bh=6cap9a2BbfmYlaJIhCTSwao4KweqQOkNFoHm+CXtfQs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=jFASUZ5obEbzFnsF2x5oB/r4yh9bT5Tl9dXl/ifOnBcobg+v6qePr+Pu9N3AGm4ll
	 6BtXdvm2uzktb1DgschRDbIWUohiNrrs7JwLrQn+yosjstiB4EzgdSjdjbM40behyM
	 Jr/S9hdMiDgxwGGION+6/p/vh/TNueKmMvxGd6fc=
X-QQ-mid: esmtpsz20t1785200718tda0b9dd6
X-QQ-Originating-IP: WAyoVSiUnM+sYMQp6Xu4ZdivdB7TbtRNuRU9j6RRMMM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 09:05:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5765152889471409520
From: Sterling-Ash <liangbaihui@linux.spacemit.com>
To: Frank Binns <frank.binns@imgtec.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v3 0/2] drm/imagination: support GPU probe without power-domains
Date: Tue, 28 Jul 2026 09:05:11 +0800
Message-Id: <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MEnmemzsw09gbmObJ7nVJm3oMj+ouwfy+NO61Ns86Iqo+j7NNKVt+Jz7
	3mmSasm710mCIjdwUb6boFQCFyCoX5ETIuERgv4cjn2pTomq03dyx07m45556IrbUYkYQfw
	oeE137gb81FDQo+/u8pObjT8prRAcFcuMzA3vnDbZMD+rXboshI/bKv/FvxMCkvdar8xeOE
	RalH7V5SBj2T740HQdHgehFNBFCDy/Y3qdN5qUA/3A6R8aeTysBHwld/oaLP0vb6FFrfaaD
	N1OoOJ6ThPnf5E6jSaj5dOcF0iv/dcXLPP/Rrol+A9VGsdiSqA1FWEaJOBp4q0aOENCJFJT
	DeB3szInArK3gnvGxpXkgVmVuuMsNXBv5jyctTkacZrOoeBZPdjjLFQ7mNVIKLYzeBdm3Y4
	fCEq2WE5eYe+CCZaYT3DtLt1yvvPvnjV/GnSYrbxDgu/JfeW2HV0PRiedg2Eaep95Y25h8Q
	TawwRs7XlyRmClUzHLFQPWxmdzy6GWayLRUTkL6ssEazYWkq8EIEZnPcBfuoYGq86Oa/7pI
	AbUvwQpGuCQWrTyAO4TkRBMacceMoeVr6pJAzNjHTf9Gh5mNV5Nr7VlD988Pn/fXGx2kB5Y
	CZE3PH4dkhrQazF7n1yhnPYnTp3OU9mGAk/+IJGIfsXT96KObO0/fBRPRDrXGbdKkMIx21V
	u4VBxMEK6Rk9JqtwuaCjH0NJ9E2UPq/4hYkNLZJecjJmVn21hsXthSzAZlZJEFz9F4K43aH
	dzM0pDi/PI8FtboCBKQKGILwINaRNneMCRvbajnLtmpIN2qTPkJed9eX0sNH+p8sFS8wBWD
	2I0UT4AOKcEGBznn7NymOzl/GvdgDDsgdAWRfGqq/wqYuy/U8m0iHSXlE8Su+5P//Gk8D7H
	9EqPok4V6BnOqkO6ariNvhGY4ZQrylopy7jqVOcN1HoKv5yAprYTLkktg5buZnFgYXx/9Sz
	LalXqXDFwHH7l3SLBPhQnXl+BrtUgt+qL+gsUwPF3mMnBYYaFdMRkJaGB
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

This v3 addresses an automated ("Sashiko AI") review comment on v2 [2]:
spacemit,k3-gpu didn't match any "if" block constraining clocks, so it
fell back to this schema's general 1-3 item range, which would have
let an invalid DT with 2 or 3 clocks pass validation even though this
platform only ever has one. Patch 1 now also adds spacemit,k3-gpu to
the existing ti,am62-gpu/ti,am62p-gpu/ti,j721s2-gpu "if" block that
restricts clocks to a single entry, since K3 has the same requirement.
See the v3 note under patch 1 for details.

v2 reordered and extended the earlier standalone pvr_power.c change
per Alessio's review [1].

On the SpacemiT K3 SoC, the GPU power domain is enabled once by the
bootloader before Linux boots and is neither modelled nor switched by
Linux at runtime.

As pointed out in review, img,powervr-rogue.yaml currently has no
compatible entry this platform's GPU can use, so patch 1 adds one
(spacemit,k3-gpu + img,img-bxm-4-64 + img,img-rogue) as its own oneOf
entry, distinct from thead,th1520-gpu since the two differ in clock
requirements. This new compatible doesn't match any "if" block that
constrains power-domains, so that property falls back to the schema's
default (optional) behaviour for it -- no additional required/false
override is needed.

Patch 2 is the previously-sent driver change: pvr_power_domains_init()
treats a missing "power-domains" property as "nothing to attach"
instead of failing probe with -ENOENT.

[1] https://lore.kernel.org/all/75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com/
[2] https://sashiko.dev/#/patchset/20260727012231.1025210-1-baihui.liang@spacemit.com?part=1

Sterling-Ash (2):
  dt-bindings: gpu: img,powervr-rogue: add spacemit,k3-gpu
  drm/imagination: allow probe when no power-domains are described

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml       | 6 ++++++
 drivers/gpu/drm/imagination/pvr_power.c                  | 9 +++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1

