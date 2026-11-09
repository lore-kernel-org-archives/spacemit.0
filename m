Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222751;
	b=luV4UJ0VEPIAlCXAyfav6Va9JXjdvWaPfqIeRFEhMtUwoLbx7zD1tuk6qDNBwyzNyA5v
	 c2Ppy4op6skXGAH2GYT9UgdpQ5um1Kv7+7FUZnGvOR85H+9xb4Rh+MTXA0Or2rEoOK5R/
	 U53MBtkuJSqDw7GJvUzx7WjgWTN7LfmalXy6fkaUdnwTcqzmuo/lV7RB024gL1T3dnUVq
	 ThIpoq/9Yn+mg2WIkt+UEbDZfOWYEH6/OOU7+g/xMs0k72dboOirX4+dWVh/N74Mo1GBR
	 mjxTqWzkjFZhqpmi4BgZOWRWOVpOSLVo4bO0EAM2hBzv51u/qS1jk09gkZemsgSHKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222751;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VGlyRg+o5Sd5Ky/RHL0mANOVwK5aB0JC7ZTXPrkLOqw=;
	b=uOoRu5/AHOy26PNWusNKhpXlJA4Cv+uoNmukU84aryp5atvloRXBzKtlppZ+5EOtpXrs
	 qRUpl8YlkhpFl401LEbhAmcJT0oZjqmeCmMNhWwQgpZVJAtQhvGKgxst89conpSs40RGZ
	 m66oN9eolK0yxz5MM+qKDx+gdNBor9gGFJrTta+HCpiiRl7WbpIn4lbbxfJzds4qcjGdi
	 B6bfUJNSw3XUQie9GL6UKkEp+IIeLGsFpFbtlwdtRZ1dozirisQQwl0y4uJGmK38m/d6U
	 qIEoZJUBbMbGNtXLUt35erblJWDXXhSootWy/45wQwGXTeU+OYdJg7bTRAc3SKOcHGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FiZcCj2L;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FE606A323
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 11:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FiZcCj2L
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 0DD0720DDBCC;
	Mon,  9 Nov 2026 12:12:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id E0B2020DDADF;
	Mon,  9 Nov 2026 12:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr E0B2020DDADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794222747;
	bh=VGlyRg+o5Sd5Ky/RHL0mANOVwK5aB0JC7ZTXPrkLOqw=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FiZcCj2Ld/NK8nNdxoys4IKC3uHaNsdv9/dkClybfxguo42M9eeRzgMg2h4BfAFSs
	 PmOdJtGSkizPWsUgsqnadCtP9asm6tj2QPbz/qMzP8ODOeuas2SxB0PvpafUsR6CJ1
	 iX5ihmZa6BGcLdWYyX9nt9TB8Y1icYr9zECj1tgR4SUbYyRiqG2WOIAHDsQKcHMDPm
	 mim0mTuicn0X2ly5stl5tFJezd+TeYicZ2h7Sn+qjKCxB0nt7XxBKjhIzY8lDudo/c
	 r0pSRvVE36mko95KZoSK904+i6z0l7am2OJZwvIR6NiGtC6plEZ/UEi5p3QOGANrNH
	 IIlYKRiSM/iwA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id O1WZFjff3q2V; Mon,  9 Nov 2026 12:12:27 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 26B8D20DDBCC;
	Mon,  9 Nov 2026 12:12:27 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Bruno Banelli <bbanelli@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1 thermal sensor
Date: Mon,  9 Nov 2026 12:11:50 +0100
Message-ID: <20261109111155.293849-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826-ought-tableware-73678af4dd1f@spud>
References: <20260825052233.66850-1-bbanelli@gmail.com> <20260825224905-GKD631715@kernel.org> <20260826-ought-tableware-73678af4dd1f@spud>
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

On Wed, Aug 26, 2026 at 09:33:10AM +0100, Conor Dooley wrote:
> On Tue, Aug 25, 2026 at 10:49:05PM +0000, Yixun Lan wrote:
> > The patch itself looks good to me, but since it deal with two diferen=
t drivers
> > So, can you split it into two patches? which easy to review and manag=
e
>
> IMO it's fine being one patch, but this temp sensor should probably be =
a
> module?

Tested the same options on a Banana Pi BPI-F3 with v7.4-rc1 (dwc3 and
dwc3-generic-plat as modules, SPACEMIT_K1_TSENSOR=3Dy): both USB root hub=
s
(2.0 and 3.0) come up, and the five thermal zones read sane values.
Testing done with the help of Claude (AI assistant).

Bruno, do you plan a v2 split as Yixun asked? I can test it.

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
