Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13133EF
	for <spacemit@lists.linux.dev>; Thu, 21 May 2026 02:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330804; cv=pass; b=rCwrIuqfsUe1cglILe+zWma/7hW/gRyBmAc1DFMmQ+W5hRmIPT/rzFmuop2U7GuzTj9bQSCOOQ3/zFWUHzy6TC7bC0SUdETCoBV9j9ySaJ0CAgDpVyQeF9QrqptWlYBiVYHmVt/t/i2tdowEdoQy/tPkpWyHgOs+RWY/YkO03qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330804; c=relaxed/simple;
	bh=s/PblY7klnzCYy8mFArJf5ReUrplx2JZSs7qfE6ecHg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B8D2NNAqv5gJC/0EpqQ3p42d3smdTS+qIXlstswhQZ9aKes99ms2PCeM4EV65ufsdDasq+uWFhRFrEb2WlIbguWPzVvp69MU71I0zqE389kIFv1oWLPjLm/5KkeEfF/1RdjqdquwBT8GgJVLbb1JjRbGY8iOJ5pM3xeU0DXxFzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=pNgoulAW; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="pNgoulAW"
ARC-Seal: i=1; a=rsa-sha256; t=1779330781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eVvDBgigwF2rob/+3k/GEbK0SCWdP80MVE6dQOJ4IS4tT28cVC3ktxk1yhxtjkckfrNyXlISZJdcWVW11Q3cOjL+/b24LQZxd+q/mqXL8eEKZLkceFNCA/yj8Giw/FIJ5AWQ10oMxrP4RC4F/5rYK7vGtelfBNr+Zx1hcmyT3TY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779330781; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s/PblY7klnzCYy8mFArJf5ReUrplx2JZSs7qfE6ecHg=; 
	b=TjNiWwGJO65U0ZKo+j+F42vQVbyzipNjWM8ijyUKYL8ntGslROkBd4uDfm3QU6VtiUFJwawskZzGJESs2JB5tufMbf5APlLHNYlR3rowJD3FyHoSDKtBdx/IjEiUDShrT+ZFCc40DPMTs+oo/hXG8qsffCO4g4H4pdYTUcquIMg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779330781;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=s/PblY7klnzCYy8mFArJf5ReUrplx2JZSs7qfE6ecHg=;
	b=pNgoulAW1XGya22Rm7gNmMSVWzNG019lRBUFD4i5n8tFmBnUYgZx7B7binQ4iorw
	VWr8olctjak12Oo5Rfj1kmEsEjAq8RAQxpSeaGkCcC3LykkoFxZfkWd8heAJZBtR4xQ
	yTgyCLbfm+BDZ2RUeJyDkIO3j4TSzLzF/VwWGiEs=
Received: by mx.zohomail.com with SMTPS id 1779330779681268.8860829590343;
	Wed, 20 May 2026 19:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 10:32:46 +0800
Message-Id: <DIO045II19FT.2YKEZZ74Y5WAL@pigmoral.tech>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT SoC Support"
 <spacemit@lists.linux.dev>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 3/5] riscv: dts: spacemit: enable eMMC on Milk-V
 Jupiter
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Aurelien Jarno" <aurelien@aurel32.net>, <linux-kernel@vger.kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0
References: <20260519041458.3287843-1-aurelien@aurel32.net>
 <20260519041458.3287843-4-aurelien@aurel32.net>
In-Reply-To: <20260519041458.3287843-4-aurelien@aurel32.net>
X-ZohoMailClient: External

Hi Aurelien,
Thanks for your work.

On Tue May 19, 2026 at 12:12 PM CST, Aurelien Jarno wrote:
> The Milk-V Jupiter board has a connector for an eMMC module. Add an
> entry for it in the device tree and alias it mmc0.
>
> Mark the device as non-removable as eMMC modules have no CD pin and are
> not supposed to be inserted or removed while the system is running. On
> systems without an eMMC module installed, the kernel emits the following
> informational message during boot:
>
> mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
> mmc0: Failed to initialize a non-removable card
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>

--=20
Best regards,
Junhui Liu

