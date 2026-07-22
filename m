Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4641CB54
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752285; cv=none; b=VaDFV7onwvCV1Y9lbNazhZgU4Ez3hVV5B/fRWxrpTRYGstq3fjHFiKEBDWn/JiYYa+ELlbR4HOd4h5K1RFmDTQjs2SBgNSP0E/bpKuIBF0U2OD7AMv70/W/bPjVKp26NtdQzI26o5CpMZoEQ/LRbSwuJxRYiiENjAf4dKzajrlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752285; c=relaxed/simple;
	bh=8lEKDzieuS8p6YYUTnoJFqUQqAiPzAliCMhOYKur1UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=BV7ksnydsZk35zKzwfZxZLLvQeSXPngCp7IC/GOkHiuW5hDNAPP1V3MNn6330RZ1Bz8SMlN5zr/iNKGGet3ON90QljYK4cDCstEQBmtvfM+5+yib0CSC1lC5NUBmW5a6xFwfoqgjYP16M1NgLbnsL+Sppn3OfhjZxzwo9EPMrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i3tdhocP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i3tdhocP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
	b=i3tdhocPBuwshF8ZqEp359F+MNNjRlh3ZgL/ToP8VnVZIkhQSUC1I+WTa7jzdQnu9Fs0WL
	+RbswGXqb2467qfFNTz4VR8BJPxaAlrBSHa1wrviCaw/P68LVNpafdoKvrdX7iC/lkJEWT
	zSzJAxUyny7BD4T0rO+hyXHDg41mHWA=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-g2Ab2z9hNXmC8gIAIdDTaw-1; Wed, 22 Jul 2026 16:31:19 -0400
X-MC-Unique: g2Ab2z9hNXmC8gIAIdDTaw-1
X-Mimecast-MFC-AGG-ID: g2Ab2z9hNXmC8gIAIdDTaw_1784752279
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6688d64bf2fso2748170d50.1
        for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 13:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752279; x=1785357079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
        b=ljSA1SHJsQvKglwL1A6p9KEY9kD4fKe0ehc5ruueHJtKEqGRLDPjmX2Bem+wl1g87L
         JfrJcPhO4Y3vZh90mA4NqpVZ4qH2ntjmNivUf8TV1niq+OZE8XH66SlIOxrExPtCiUa/
         4BsleASnIpKB/6A9jU+IM6BbLuOhxoixZ4Q9q22P3HHTXujNmKI40xs1du1f+ir+mG4O
         by4nTxOELR5neVKG0bdvIzS3dbBi4fWsf4bvhFpiyBVClVocLWfJOUU8CCIhjjMYxSfs
         49Q7CyDgQee4wkgDwLDgI7N4zm8Zo2t0v84uD2NtG6puHGDf4E1hm0FmKVWWhvg135f9
         u+tg==
X-Forwarded-Encrypted: i=1; AHgh+RrlAYf6PuKpTz3Ee1ry6UjeMZcJf6/q1s5vDsMlOe6q5fIScVEjuJVr08Mz2b7auN9JhnhhPTJ3Cw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1xk3jzC9QV7prTItXaYJ0Tpi8RzHMpbjsew31oYKjij/WwC0y
	3rtJaEuErbDcrXF6y8Wi6nuj2V599qVT27gZbnoEMABPXI2R0Mv6ueNCAk4/TK5snqeEQe5+Fs5
	1p49qfjUSoLxFPBquaNXgmov0f3HVeVwlnYalpMKYYktKFnmMXXD8C1ObG1gL
X-Gm-Gg: AR+sD139WGgbjFRujhZqBaSZjFKfqHIugfiIHnpQPl0dbu9kONOhgOXZyBB1vqB5ykh
	8fvAk+ZQU65QVwGCBJDsuAisZjMi6RJX6rkaESZnwpTD5RvO/UNfY7yMbT/m7S5zwvdQvx0BqrY
	1okFRszDZ8l0DnGzbPsJepgYDqZNyrIwEWkvqE0LX0KTIyPEX7AA+kTO3BPYcwF7UUDwWXOCVjq
	Y6i+KMBqfTwcBAazho09jLjGViIdi1dVmiZ3Cb2jFoSW4kB2f42LF133T1AVBXNuL7agrcOpfMo
	pi8TxAGCkUZFCPszXQDX0M840/bT+KUgNhID8rBN/lz7bkuJxPl5nw==
X-Received: by 2002:a53:b193:0:b0:668:8eda:3dc3 with SMTP id 956f58d0204a3-668a4bc45camr38859d50.21.1784752278774;
        Wed, 22 Jul 2026 13:31:18 -0700 (PDT)
X-Received: by 2002:a53:b193:0:b0:668:8eda:3dc3 with SMTP id 956f58d0204a3-668a4bc45camr38841d50.21.1784752278064;
        Wed, 22 Jul 2026 13:31:18 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:17 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Date: Wed, 22 Jul 2026 16:28:46 -0400
Message-ID: <20260722202848.1817988-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lMOsPw0QbLpofUpKCJwAZ3TO7LCIbUrq74d2HAXtd8A_1784752279
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
module and one on the carrier board. Both use a Giantec
GT24C02B-2TFLI-TR.

Jennifer Berringer (2):
  riscv: dts: spacemit: k3-com260: add eeprom on i2c2
  riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   | 32 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 12 +++++++
 3 files changed, 59 insertions(+)


base-commit: 199380e4d8cd22e539a08d4949e9582b09390bd5
-- 
2.55.0

