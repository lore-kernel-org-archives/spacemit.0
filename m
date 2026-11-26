Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712553;
	b=Us3hUfzPepiHbPKYcBIrGsk1drFiB4qqRV/GjUzgJtccRVSsuyhuta6C+Z045qgri+10
	 fOJsv3Q9lnb5TpZB+c3NE30+jUFJ6UO58zjUPDq9XbPawT1z3ATzzaWXT3bFat0IwmfLK
	 XxLLliZ4IvS29sRfsM+wCai6NcFQ/M5uYbC6LJo7wIIdC3LGgei7r8BMqDMoFUp13YnVS
	 5y+5lRgayLxrM87Va8x/LHAdjLV3+hVCAwzN+JR6zBFPD+wABKvVqPDXR8K8vN1ean4oB
	 IyDrwX22kGjYLAiWvVYrnNcQ0SJsPdJ8yacWJ9q+VWUNTm2+OQSVZ74k70W6YwtQL8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712553;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y+Z5OcIdHfLl7WqjQn8j93xvyYaxhnjrN28MjRvFBlg=;
	b=xw4EyXowhiMLHfC478YcxL8kiH6U7twW8HJ1iJoelE0hoTHr9QSq7bfNpd94QgI5GUxq
	 eIbEQliK29ZfHu5Xew7ataCOPOS194SSA2mbdfAZy/2OYvI2c+RCd8UghtFeUjDMxnPKR
	 WLEACUcc2aDUk/oBZLsPfKO2vyOXTW9a8cXyj6fPAbEsq2w6sRKTQJcy/3MyEaWu2FdFD
	 hJmrVRqfHUv1l6ZhjmUsg/A3oYZa/psCp+Xo49IK3LrZcV8K19dkQztLUPH1EAshpJ6PZ
	 lklFvp0PyTIrZFRnO8P5xNz/4CmgKsfHhC2Te7soPuG2dt+u7Uz8sSnaQkLQeCRb5qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=O59FxSK4;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADF606A31C
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 17:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2ADF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=O59FxSK4
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 9727A210CBD7;
	Thu, 26 Nov 2026 18:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 6E3D6210CB3D;
	Thu, 26 Nov 2026 18:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 6E3D6210CB3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795712551;
	bh=Y+Z5OcIdHfLl7WqjQn8j93xvyYaxhnjrN28MjRvFBlg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=O59FxSK4jt2QJZeH38U+RTx2RLeWK+zf5SyVpOIWXQyQELQzV8XIl/6QulIq6L3L9
	 hcyorfLELSjAEs7jBbgpdYjl6jVWaLcp/jZFfWwmSZnMC9jbwefnXrlJTcz3zcmEIn
	 AabeyHeMSkMAHJaqos3sPcoBb69muReD9824aImQbCQgD3ijeYie2bzvzPoaMH+ppu
	 pbyTnZpLWHXreL0V/GND7/9xwv6WE5WbYzkDjtFH6KruHaXOISaYeiGXJnMz12o0Yw
	 3zpdavwQyr8Id4xoDAMMJM7EIDkW/709XqiqnRi24lGukdaF3fC7+m6k3pku7MYUee
	 pgGiy4XlKwCzA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id XV8IBwwsyA6k; Thu, 26 Nov 2026 18:02:31 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 6C238210CBD7;
	Thu, 26 Nov 2026 18:02:30 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
Date: Thu, 26 Nov 2026 18:02:04 +0100
Message-ID: <20261126170206.905453-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Troy,

Tested v3 on a Banana Pi BPI-F3 (v7.4-rc4): d4014000.timer probes and
becomes the broadcast device (oneshot, tick_handle_oneshot_broadcast),
with no new warnings. W=3D1 build and dtbs_check are clean. As with v1 an=
d
v2, its IRQ count stays at 0, since mainline K1 has no idle state that
stops the local timer yet. Reboot from this kernel is clean.
Testing done with the help of Claude (AI assistant).

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr> # BPI-F3

Fr=C3=A9d=C3=A9ric
