Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338276;
	b=Z3877mjgzogP9NA0cILhbFdgTeh5LsQWeqRD0n9x4VJJTMQzwj7l31wFQzBKi3sh5dLc
	 CqUlF4Ri4W/SLOp8hGud7NZdsHjakUR5Mna3GIR0Al5/B1wWMCp+K/x60GSbXLQ6VfPeW
	 oPdrXFpSOepFa0ORxSJRSJeye+I1VnKd+9VQ6ow9blKa0f4JsPnpozF4VUA+S8J+0rIHp
	 HNXuYxqF2BC50BYNfo5uD50gZdYsQq2QwBy6MMa+t6QXKHRE/PXojfUkdIYaySmdW6VLJ
	 ZS9aG2k6fB9qcSkL1WqOo9vDVXW3DxlpvncJW0KJTMagHCGcIXF5OldPiQVmfKB3GgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
	b=thgqXUYcBzYI453wv0yT1XTleur5k02M+NTZ7UiYco/IZzMGDKxsXrdooOqBUDNaZ/st
	 5yjJP4fE1/LKolnuAoxnxjR5544VXl9KfiPTO0QbnAkADEpzMD+gD4ZHRBdbn24Wz+PCL
	 xYuML7NquKWsInblXZzGTJnQKL4e0+AXwpbjAQKNdeTzVyxvk2tJOP/F69tWc4xWgWHM0
	 hxK1Kz9ADBkdBqM7v6K1oZPcPpOCac3qemJQoFqkQdmuRRqwR1jtYyrIt11XZEvOMFdzX
	 De9/yAMsMpM4CNWl6dBAKn2zF1yUzVoxVAk8WR8nxRzdTaxusp8TdUYGuSDJeRrTbCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySGXAumE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98899606A330
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 19:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98899606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySGXAumE
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b349d21fd1so18747597b3.2
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 11:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338275; cv=none;
        d=google.com; s=arc-20260327;
        b=nKRatSqQO8CIGcIi8JrFgqDPoMM66N8h6zDUieWB7vv94FqW28FOuKXpTUFs/dNa89
         uLrgA+/1g5uJkOek9dXIhcd/bnTxsSA1awQTVFdBTX+d5nfb+FotDccBV/06Pq+Ki7jf
         A/IBkvonhu5tx42o+NkruCzgPi/fr8n9HAG+BO3/hzaR496qEL7rgBa6QaOMSW8HRt7j
         vaNhEfg5AbJ4hXLLiWeNZHGMII40G/YSC7ySSP6kCfeD/phdgM8OFpB/xweATFjVh+dE
         DELiGM8jEcmElHBiGWZwl6+dX5GOmpNNmHkePtebQCYVyai+kMHjpLM3gFIo5q+R/JsY
         xp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        fh=Z/htErFtupDtpMOwjRgMhV/5rvtJrC4GT7Fhe4b1x6U=;
        b=ohyckv9yHzHQfsjGT+94qwj9ez1hGgcmKWrjkPRv2Id3j/tplh6beukYeo093TPJR2
         4hBjKtqt3Q4Pt7uLm1oEYWruHlgqYUS69s+H62p5ZPPtdyum7z0lEPTIcIOT8wq69AeX
         XpOo195gkUXQUvNOBeIEF2LtG3L7II6VkFMJOihaWDRnvgGHgtlzy5+ktax6sT2AVKai
         HUimHjIE7l+j7kbu3LoGj9FeqhPVhlmnk56yeWNxfzz0EhXEwwuC3CgIMlfrz7WJCI7y
         D3fRWAt6Kqohx81WDg4JgweIUtVl+opC+C1PdCKoZXshSm+RJCNha6snvpinW+UpBQq4
         3JhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338275; x=1794943075; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=ySGXAumE/OD6a7Tcqii49j2NaoZzKvZYQ3ueKkVZinOVgaYRxyr1u70Uh6vthDNylX
         oKa5i0sPyqdo0JtutAHgpjpS5z05MAC9vKyc6RLHrVdHokgzzE0Z4IHGLVN8C3WTVTx2
         oF4jh57zlGJ2YHO5QNsQ8UgUSTz40ym8tKIOndo8tpJJ0bTW13SUvQX5rNsndoDLwyrX
         /kxgoerG2zVT51qTDpGkRIMjErCvgbrn0qgv0bt9KrJ8B7pun6oy+NkuBrjfpLKOdcNv
         8ggwrq1YaoYDg05ggP8oj4o/rZMbxj3w9nPZxBifCWf2qsmcrIqLjB0KOsn+NrgyMh04
         73cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338275; x=1794943075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=TlGuRPCieEJ6c6seluL217FWhjmVe+yQ49gEJYcV1HE1Gyj/V4lEuiKPajH9R6KMC7
         Yi+cNqZBsi4JXyCqBeWGMsOjBMBfRRGQXKhxmslf40u9syxS77qkDiqQmiaNSIC/o1CI
         5wsAy6qccxxe7pkQc5Lw5lGKfYXw+DHb+l591fXgbg9Z9X4Mdz6aR9JNAn1JjY8P13ry
         lALFLDj83vDzgR+ku3r4gfkFhFdXoMl/+5buHQetPkyMIcYma26/HlMy6NytoHhoOhhI
         vM/koneHeL285RMTG4cPvaX4WdOfqBz3Tr31qHArqTcMeoCewJ8VjBMUsR6j9m4CLEsE
         lrOA==
X-Forwarded-Encrypted: i=1; AL+hErEPqFGr9bmlMO7/XlF+i63zYh2MIXGlp1L258ThxVYlRMzd0yfoUEbLMaTvy2njdiEq64Q8hGgAYQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/JJhP0QDmTS85m1T7LtDLe+IYDoZo7Cyg3jutj6fY9lv/1aAaZ
	xlHnpO4vnVJzWvRo0sOnJDkBGF+SJ0BYQN5uqbM37YgbmAQBeZmZMLlxIkmOGed55dNgsoLMzAq
	iIvSJ+ToY4u9LhgVnHQZ697JT9G49EA5fPiJR
X-Gm-Gg: AYBFou0RYJfkQ23l+uHpeCQ9Cz+LItx/vZz9fWz9TwNyXqHy2/7rKliwBjQdmiv+4AM
	rA+AktHHkRpKbaCdZOCM7uOGqKbPlm5E9vnVQrPbLw99Ae9vZKSUeaWHIqhMk+Z/5c2MHDjoGur
	rowVwsoKl5vrcpFXmcOF7dLB27pAhdDzPY1XMXXOZynf0D6yXDiZHlQ6AaX7YYVv+HN0L2guogQ
	6j5pXcP3n9Hvrsbepn6oCDUjWarmKC6JMzxLOBnffQrVH8CbDHt/6178ZUrJ1w5NZaZ55FfGdCk
	NT8zwQO7xKd161Y8MOTnFXv0fb0yBvv8mECVFLEtoF9MdJqmXGAMa/LtyKGWT/zUCalaWwHGlcD
	LEMVyM2RimUE5ompK+opbtJesV1RBIO3BytrPJg==
X-Received: by 2002:a05:690c:a045:b0:8b3:59dd:11bb with SMTP id
 00721157ae682-8b3a80904bbmr1548667b3.32.1794338275490; Tue, 10 Nov 2026
 11:17:55 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org> <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
In-Reply-To: <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:16:00 +0100
X-Gm-Features: AclHuK8pMvnG1Q-j9dHb2iJ_gKQ1ShQm5guoJXhhleP_Gp1CskmuEJKcLhqrA_k
Message-ID: <CABdCQ=NCwHn_Qtg-KZCRYWrruDWrP5Fdpeq_Ci_vtcbm92hEkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Patch 1/2 is unchanged from v2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>
