Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADCA49B449
	for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637579; cv=none; b=KMECuJRyYqYzvSBYvKGHg21yi7F85EX6Vy2J0EONMEECopDpts23QgIMOEboItjLwI3Nr985daZOgx6LcH1AghOgmYXhBSf+M1mhOqoHQdd+TYE20rCdENSiKUT0sabMABAvFeiPF/4pcFyFGU+2W/5wKNgc0hBko6Yvm8OkmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637579; c=relaxed/simple;
	bh=8Hpl/jJQXgMDIx/9aRjnDimcwY9u+PRuHlp14LtJI1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=chafKkp1HS33TRw0WdqdtDkC47MwQ+HRJZ4n8c+chZ/6uzUL6B3OzYmUamAIkbmEjbp5vYQsVSA/N99ppz+GVjuGZTX29XVPvRVxb3T80eA+31AoUCBJ2QwMSycVWwpPi4IcmZWuQeM/wusabKqLJtuC09HytactfPvtcO6T9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GaB3jPL+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GaB3jPL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
	b=GaB3jPL+Dd6SZ/XPk3D40SWCgSbtUQwK8RA94cBlGT8kH6cVBq6f37JWQOhmgg7ynjHnu9
	fybb9T8n7IdWwKsU3K2PZ62czHtnRaDq+6KvN7MOvcK0vVv6ZKbF8fCFOwkiRkdwlHreMN
	88x+yaab4WfakWBB22ycbIGWNngKFIM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-L8N6VgRRPdSrY8U-WHKDRg-1; Mon, 28 Sep 2026 19:19:35 -0400
X-MC-Unique: L8N6VgRRPdSrY8U-WHKDRg-1
X-Mimecast-MFC-AGG-ID: L8N6VgRRPdSrY8U-WHKDRg_1790637575
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8546e211940so50629417b3.0
        for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637575; x=1791242375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
        b=TOP6u2NIyKCbDDRcjkz8VDxONBDXmIZJdNhWYuu2J8q5HFPhTlMYs6QMS/WinJWkRe
         BT9zDF+cU6R5MOaAkGStjlXAHbZrfoV3470oLSTB28494iXjxbprGAJNm3MX0f62m0J1
         C65szdJ68apIrN8bNHHgGX6vpZxslTWn7M+8ZhtaFue/koLRzDXfgbXdRcSLZ781BzeL
         O3x2SZUE/0vZz9SpvV88Z8SJCARqscge+Ol6b0Z5w5fXxZBhz2pWp43l5ddKno/O/kgN
         Ac/hQiU7LqcJtJ24dIgmAgFUXFNVDpRIH4xkGNqkMKGarg9bTqYYryIoQc0At5w8dIF6
         qk4g==
X-Forwarded-Encrypted: i=1; AKwUvBzYid2cJ+2t16plSGe0Y1DCbS41LOt0jMl+ohurMmSbWAsKd9Df+oOHCO392s0p6nP+Y+XfBQ94tQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIe9NrlEQOCpRsLNVnd8fwY5IWDtY8dXXo63hBi6gDOBcV38+Em
	aDAiZdgTxVujOsc690AnwahtMi0Ch6hwk4TxwUdiBz7Xxu9iNYkb/kgKkCUqb+wJesbIbkhkj+G
	XYcIRwQ2XM1uaS7WkllcP9TvXI3UhmHn6IBB8veXAvQHhNV8KrIUAvQWI03zO
X-Gm-Gg: AYBFou3s7PXP9GGDj1eHKCHQYj4utJALHP0IyZu21wzSFRg6jMR2c2rEYlfdgszMz89
	2K6QrJWHBJnLirMsEAb1Xc+tQG88nIPeKlrd3qt9uISL50CPLjIBVpHP8W06fcYQ2yt8eZXyDhf
	CCKt6eHwKbfN115wELNfQpkm1EWQu1o+Mm8VGUTp+tXKmd011Ddwb6fiJZwIqB4tYwB0X1Jvk83
	ATyee6JEagK0Nhv2HhSybcEOFFTU8AkEO7Vr/HEqXaktF/PQaAwGeGU9yGgOMeI3Nq19oIY2G0Y
	rPKEGNm6ThMJOSPglqUkIBtTetaegSym0J54rjXdqdaz/tzAjm3G9Q==
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722557b3.48.1790637575140;
        Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722437b3.48.1790637574673;
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
Date: Mon, 28 Sep 2026 19:18:04 -0400
Message-ID: <20260928231807.1757995-2-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jp55OowIekg-VwaUGUmq5FRFWU9SZV112mKQRXzI9WQ_1790637575
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: James Morris <jmorris@namei.org>

dldo4 on the P1 PMIC is marked regulator-boot-on, but has no consumer
described in the device tree. The regulator core can therefore disable
the firmware-enabled rail during unused-regulator cleanup.

Enabling pcie4_rc on a K3 CoM260 Dev Kit without this change while the
board's included RTL8852BE module is connected to the M.2 E-key slot
results in CPU hard-lock, as seen in kernel log:

[   32.521536] dldo4: disabling
[   48.125823] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 4
[   64.125829] watchdog: BUG: soft lockup - CPU#1 stuck for 26s!
[   64.125926] Hardware name: SpacemiT K3 CoM260 IFX (DT)
[   64.125928] epc : smp_call_function_many_cond+0x158/0x740
[   64.125938]  ra : smp_call_function_many_cond+0x11a/0x740

GitHub Copilot assisted with diagnosis and build and test automation, and
changelog drafting.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Assisted-by: GitHub-Copilot:gpt-sol-5.6
Signed-off-by: James Morris <jmorris@namei.org> (Microsoft)
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 92dea86397798..054bfff7413a3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -187,6 +187,7 @@ dldo3: dldo3 {
 			dldo4: dldo4 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 				regulator-boot-on;
 			};
 
-- 
2.55.0

