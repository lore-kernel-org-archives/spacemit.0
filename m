Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038DD1A0B0E
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 01:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200794; cv=none; b=rraFOj+pmlDX4Q800buIxVo14dpMW6Y0tIhxEIIhLNon2vuYAAEyq7mOoebtAtyaZODcbzfS3mCRj303bh1OuU/FfTrbZs9jzuw0DjEwf/Q8Kg5YMnUm0cyAg4CVJnA+7TsMLFRK/PfHgIRG8ZS/gb6O2wevgtNYgRogSVObpmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200794; c=relaxed/simple;
	bh=UrRyg+CrQFaQgG9azpXpU+O3UhXCdb9UNm4zKZMmA+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tPbXQdP0wX4hk8Ygse4iGgUPffQQauYsXOWvm54c3cob/92iTiGbhldoS4S4VvgTFYJGkaS7PqTf0sZb0qUIH0PWYeFSW2rqT2pHfeK4DljoIa0epI3wD11MJWw2KcNsS5/FTwLRgkw8iIb7P6kj9/82kvEsK9M3Sk0pbAFRIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JNI2Wuwt; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JNI2Wuwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785200737;
	bh=abrj0YhkjdX5tIEw1QYlhdxieuLgqQ+aot0tju4kSGo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JNI2WuwtuIBzEoKe9qh4X4evFWllqWx6ySLc+Um73cA0whw54D40RFj0PlXxzqPOd
	 1hx7drZbbbWkbvCmdreTsTBMDg0DAT9w1/IfZFpRJ0pHucmDuvJI0MxO9I9iSiWrk0
	 E3i6haleN0oOEPbuMVy4QoRXr7MZUOtK4LwJ0k7A=
X-QQ-mid: esmtpsz20t1785200729t3d4b9290
X-QQ-Originating-IP: a2tKt8NaLB4fW8LMxzOmxD7eLoRxrdnEhFFebeT55yw=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 09:05:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17787826967055244228
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
Subject: [PATCH v3 2/2] drm/imagination: allow probe when no power-domains are described
Date: Tue, 28 Jul 2026 09:05:13 +0800
Message-Id: <20260728010513.1627950-3-liangbaihui@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
 <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAtipnnbTPeaCe3+ePoEXunKLK732IY2Mx39vHQruFW1ZY1NJW5TTLgu
	ZO6zVyaZryJEzz1eXOFHlfs43NYKhUHSovd/2td74GNOR4Wg8HCTwbVb3dQYuz3i9FVQC8T
	NXXKoM/MLapVNNIjG17WcIb+Yc3vXVPWqIogFcb0+z61n1hLiUraG7aE7X4qIaTqVmXMSxl
	QYmkNSjv694jVqQyFlqtb1ajpilqdcQ84Gvd8VWeLeMjVpNKZJXJX8BKkOX7mhyiuQOAa41
	7Jy4AF1Eolly4CKuCjBY32V8zElFV8Ewra8iYG7q763ArejUEoDWKSzroi/tkNO/Tyy7CRk
	R0derfZfqBSQAOY5uXwmd84mwopOZiJ/5U+0q+nD8F4ZGR8FbJmN+069Bxr4UHxLIh93P6Q
	Dp8FjEpj1F7wxRdgsJegooTAMj+w/cpQeHZhvaxpZYnbRJ+s0oEjp99w7HcXJxW/lOJv+CY
	44ojXGeqoq6lsZynU4HVmbxzYTJHXK8JtN+5vVhvXuDGmZBu5fw11wB/eerdthLJcqeFcan
	mn5U9RI3W4oTPtD9qbvx3izCfIaza69eOP7EPe3XlvTetRnijyLK8/uHP9u/cZ1Nsnv8Rez
	F5h19eFIbSKt+q1lQU3XQn2ZUWz5bjCZUWBS1boZdyjSyIr/paoZaxaaugxPSv4YIIkebfB
	Mf0u8mrKNiDnO0Kbov+B85i43jZP5HdUhPGqUvbCzopS7m6dqCw+bzqxoG5OpWpdYQDFbdp
	chVLEbvHyPMQ/YLt245Ky1UUlXYIB0czREA3rd1ewZxkmY2jc+EzPdw10oOtRoF3210pXq+
	YbgDrRlsQh/31uuslbbTdpLpfCxzxp1+w3RVLwe3+LhBFIfTUSeVX1PRqTlkoetAgS8iNVU
	/hL2yKqftGbJ2/NfQbh8/JuXaI/cIkvaEA1v5lpVLAjA3p7rLwGkULU160SvhnkaAbkISDl
	RWewezgbRqwyLw8BTgxemW/fWYb3B+/0iBP9sKINjjK6sc82OMONGG85dZ+UA7lhRGnEWcZ
	nmsf+qWQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

pvr_power_domains_init() currently fails probe with -ENOENT when the
device tree node has no "power-domains" property. On some platforms
(e.g. SpacemiT K3) the GPU power domain is brought up by the bootloader
and is not modeled or managed by Linux, so there is legitimately no
power-domains phandle to attach.

Treat a missing "power-domains" property as "nothing to attach" and
continue probing, rather than failing.

Signed-off-by: Sterling-Ash <liangbaihui@linux.spacemit.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index a71d5b35601e..5751e2d814b0 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -635,6 +635,15 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 
 	domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
 						  "#power-domain-cells");
+	if (domain_count == -ENOENT) {
+		/*
+		 * No "power-domains" property in the device tree: the platform
+		 * handles power domains transparently or at the firmware/bootloader level,
+		 * so there is no domain to attach. Treat this as non-fatal.
+		 */
+		err = 0;
+		goto out;
+	}
 	if (domain_count < 0) {
 		err = domain_count;
 		goto out;
-- 
2.34.1

