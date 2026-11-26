Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712590;
	b=IS5kc+0pnLWwg1axw8+IgpyT/VpH06MxqVTXuwJWjdOikR1wBkN5FDtysZFdcLmRr48l
	 2RoukZplwv0+M0TldhU8FfEw1DNEHqTTMdgPEMb0IDiqy3OfL2+uE1pR76B4Db26v4ZjY
	 hx3NcH0J+Yrl+jyxwzqeYws5VbUJCFz0/im7JJsufccrt3orkBEP4+KZqB7w9GCV8MgqC
	 +B6ZMMRbKjHiTcl1PKUWiz7njkA0BwbhF2nJ+sQVA+4pCAAF+hAZNIC0Jcc4fXgphV4ds
	 ocT2r9ruvrE9lwvjAd9lB1V4Gk12pg86nohbr0e8JeDQUTLovyMy+RohbE91VJxaWTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712590;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WJfxrzgsn5CBGmFNNZRXBtzroggnfDMzK8aLKa//7R0=;
	b=01MZ0YdmTkNeW/HYhOIfH3k/avuama3zLPTx7NpwuWcnmnmlecYjNF3IZ3d6L2rXAPLK
	 m3IipJNhAPR40YuFQnNHIZitEZuW6NE1ZSiGwbN0583o4klgpJFldleABURKAocILZHTV
	 6nVBNiGCdLTTjwF5Jri0BiMSvTaMYe/mTQe7pK8Onp74qnhT2eJIOYadL1hE+Qw3GkDhU
	 nUGy+qAuBNp7hkt4USRwI9MIge+O9BUTjEdiOzKgEYEtG4GOlfzfRFmYngxw/tvKdg0iW
	 3ZucSVsqhLJAIyy6B/oM2clGs5gCSiEiZce1VaVa82tZCkJSAd7kEjhC0aJu3/t2E5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b="Q/RJZWYK";
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30858606A33F
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 17:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30858606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Q/RJZWYK
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 942E5210CB3E;
	Thu, 26 Nov 2026 18:03:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 6A2D9210CB8B;
	Thu, 26 Nov 2026 18:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 6A2D9210CB8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795712587;
	bh=WJfxrzgsn5CBGmFNNZRXBtzroggnfDMzK8aLKa//7R0=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Q/RJZWYKOyyaa8FXUXNJ1MCxNZrUKsg1Eb9tBpzET1IzsNU4poIlRGc72FfFI/AMD
	 6v7M26uLKeHR+n6pZzNleFDHGzm4OUUHEnrOgZpgyEV1nzby41FwEy2Yy7fTJlFHWr
	 IB9gVKk6LzmhaUeSCtsc7IZSBT2RaCCVQBfLJHwk0GiWw4UlNF8oGuCRpNmGmC/AIS
	 BEaximxGLortdwVhLiTfjp/eyetUnK7i5YBWO/lIeWQIzcr5npq/RoVy5fRZQsG1M6
	 5o02pRgoBVAzilvY9uBQL7OOwOExEBbK+vfP2P22yV3unMhQVLNoTyfaYWU3akGF2C
	 E+vPM05pN/ISQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 2SA-72YiRWP8; Thu, 26 Nov 2026 18:03:07 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 6B507210CB3E;
	Thu, 26 Nov 2026 18:03:06 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v6 0/5] Add SpacemiT K1 USB2.0 controllers support
Date: Thu, 26 Nov 2026 18:02:39 +0100
Message-ID: <20261126170240.905529-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
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

Hi Junzhong,

Tested v6 on a Banana Pi BPI-F3 (v7.4-rc4, with the K1 and BPI-F3 DT
patches from v5, ChipIdea as modules): both controllers probe with their
PHYs. c0980000.usb registers an EHCI host with its own USB 2.0 root hub,
and c0900000.usb registers as a UDC (ci_hdrc.0). No new warnings; W=3D1
build and dtbs_check are clean. I could not test a device on these
ports (no self-powered device or mini-PCIe module here).
Testing done with the help of Claude (AI assistant).

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr> # BPI-F3

Fr=C3=A9d=C3=A9ric
