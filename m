Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F472661A9
	for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546259; cv=none; b=YKnQM51pzjHUx7P164FJvy/FWkXgi8S9sJhZxKqNRGU8+hEV88Suiad/Ea/Kq21LjMpyM+tiVHakfH6r0VtZbKJXa01V3v3gabZ/U67FhU9//EzwzEdlzOSViakySDXQx9DENqWce7IEFLm6NIM71vK08cTAV+J4Rz9rQdQvOss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546259; c=relaxed/simple;
	bh=tUTcWT3xY0aNKKrpAIhOmqVWKwDSg0YFK87E6/nR7Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=mxG3DYbEzuC+n2Chi+/9spO1vJb4igAoDuntOzsy51frZF8UTvzzIZKyyxx2cybFGqg8WG0NmWCm7R9fEH0F7dEDyBVYQkgPg/tjRqurLP0x983KOZstUVFa05s+iFlbH2nCNsxaRHVG2nD3UJQOVlQQYc5ApoixJm2M35o9gI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2nU5Gf8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2nU5Gf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739546256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dfZVegvU6qk4m7FwzKbbRj/0F95Jye2At6/Y/AuatDM=;
	b=h2nU5Gf84/KhC4btDT3sQhYjRhXkQCRIjWLBGZ9IKV+RiZ3QjbEvqmoevrxyvOT9Jhjmtd
	DmJ242elV3LnaSdK1DziKn9nhDCIGJGjK/UYSVj0zX32Sllbfi2furhFxVzQ/mPucED+Jo
	L+U9me4Yz3i1rfhlVAHCFpAv+r+a+EU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-pIoGKIDgNve2vr07xq5jtA-1; Fri, 14 Feb 2025 10:17:33 -0500
X-MC-Unique: pIoGKIDgNve2vr07xq5jtA-1
X-Mimecast-MFC-AGG-ID: pIoGKIDgNve2vr07xq5jtA_1739546253
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dd5031ee7so1576244f8f.1
        for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 07:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546252; x=1740151052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfZVegvU6qk4m7FwzKbbRj/0F95Jye2At6/Y/AuatDM=;
        b=qUmwUiRtBqoNjY2EnwSYRuuMBqoFO0S3sLFTaHf5zKUCTSvOva4hgkDhf1HsoryMeM
         ME55Wu5jBhhA6HTBS3igcQjFiOnsS2lbfZjToaCfOmUH1Cw0zkcbQEZ2SBoCLoJJCBfQ
         XuKRtffhCnBZCbiriOGyJkw58So0VvD/B0SBTLb+9sVAgZYV7HxybqqZCeskA86ssP/3
         NJad70wy0nVSEOvz57/+fcDh3ANZ8o9b+eH+E0u8FZhpXarLECNn64xo2KiWUmNoKRHH
         Pu2uxuvARmdH96UjP5AW1Z+E4/rzBzqJRN8otsD8wp3gPtjlPk+Vp03D0VauvMj2nqAw
         w9hg==
X-Forwarded-Encrypted: i=1; AJvYcCXONpTDYI9ciYc4qi9lv8fVCLGfGvsiJm3SEYTP62YVv0p3r9NABAjzdZLg6Ep3tnn/BIfr/4pjyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV3sebZYOUVXJT7x3LSR1KqRUuAtwj9uC+4XodpMPQa+73Rsmd
	eGOdYonLLMxfInxt3Vi7sDt4KC859sene/T0oo7pErKEqDGkhaVSegQWE1bmCekD3mHV0g+ir0T
	KoSlDXg6KaHly+dknK1QPxUldlMQo5VddxZvHcNq8aqqQIDtMiOTRhWQM
X-Gm-Gg: ASbGncsPIQ5Cg7V3tfzioHe5LYTB/LOPEAkIEv9Sv0XHSXBkUSa1XRM6MvOJowlG07H
	WGkmNlZA6s1kt89hipK4lzkIK3y7kDnOjI6Lci8z7wnWHAlh7QDwlCrGWU+ZQeLdJigteWi7ht1
	ydbEHIDVX2QRCMIVYhucdOdaOvi9wCSZejHN8WoEq9lWsBfXozkAWpS55dUtdw7j+o4JlqQNd97
	wPLoyAuDs1KjH8+/bR15WlJ8HBZfGJlIH1ronGzi82svmwuqrjLUV9hqMoqlDydLtOwqacg3Fr5
	yEBKjFVtfnqz4Ps5vW/xJDkTj1d/jQ==
X-Received: by 2002:a05:6000:18a7:b0:38d:dfb8:368d with SMTP id ffacd0b85a97d-38dea2f76ddmr11997622f8f.50.1739546252664;
        Fri, 14 Feb 2025 07:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqA4RqLrxgT7ylPsH/Tx2/hd3i/GaBHUNlAKmeVU3IYJ2UXCjv9nvu6wq2BY2mLXriK9b/Xw==
X-Received: by 2002:a05:6000:18a7:b0:38d:dfb8:368d with SMTP id ffacd0b85a97d-38dea2f76ddmr11997573f8f.50.1739546252260;
        Fri, 14 Feb 2025 07:17:32 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm4855672f8f.77.2025.02.14.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:17:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org,
	rjones@redhat.com,
	abologna@redhat.com,
	spacemit@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: dts: spacemit: Add initial support for Milk-V Jupiter
Date: Fri, 14 Feb 2025 16:16:36 +0100
Message-ID: <20250214151700.666544-1-javierm@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lx5e-qP61QjTXPj_DBIk5kvGdb-WuyJ4cWt3NKvjg9c_1739546253
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hello,

This patch-set adds a minimal support for the Milk-V Jupiter board.
which is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC.

The DTS is very basic but at least allows to boot into a serial console
and get UART output, similar to what exists for other K1 based boards
such as the BananaPi BPI-F3.

Patch #1 just adds the compatible string for the Milk-V Jupiter to the
SpacemiT bindings and patch #2 adds the minimal DTS for this computer.

Best regards,
Javier


Javier Martinez Canillas (2):
  dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
  riscv: dts: spacemit: Add Milk-V Jupiter board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 27 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

-- 
2.48.1

