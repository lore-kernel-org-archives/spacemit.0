Received: from out.bound.email (out.bound.email [141.193.244.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724E2D8799
	for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.193.244.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685582; cv=none; b=jV/D3mFan5yBQk5GMs+d1ABNV7/gkcmfgDmg/0orJ5zsFowLSr07hq5ciJLxCuH6XQCiHAvdv6bpLSkSwsqnJpM1wYoF0J9tJb1SlLnuTaCWBHeXKto2YDCO96JG74yJLTL6DaAciM2i2WSbiSl6gxjsM7e1QCbLqNI8TeX6jQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685582; c=relaxed/simple;
	bh=Hv8DHOlyQnNQFBqPcnrsK3QnDX2yTB0jidqOY1dVoY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6Ei+dzYR23fV9SHU7/FweZQgExfYRh0MEIildldm9XQkUls47QhPxI3ng26jtkq3K++aByJfZjOSorj0hKx2Z4tymRDzAPT/3K/1SL2JybSoHGg2t4yFhl+kf4/EpaB2MceU0BDDk7a0vXNg+bU/fAkziySadS9Rl87KaD7AME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=erdfelt.com; spf=pass smtp.mailfrom=erdfelt.com; dkim=pass (1024-bit key) header.d=erdfelt.com header.i=@erdfelt.com header.b=jcn4Qm+0; arc=none smtp.client-ip=141.193.244.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=erdfelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erdfelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=erdfelt.com header.i=@erdfelt.com header.b="jcn4Qm+0"
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 341EF8A0A03;
	Tue, 28 Oct 2025 14:06:19 -0700 (PDT)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 1C913160036F; Tue, 28 Oct 2025 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1761685579;
	bh=MG2CHoxJgPs5SpTo/dvhA7IRWSaF2xM68nlYgIMcDJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcn4Qm+0JCJsdorJ1JBiojYDHyMW7YVNCTmSHHHY/FrNV4YTHwhpO+kiX5dWW2tXs
	 KFzHhV5TWX0wT97cjNNlL937Bgtwe3Yp1QXofXDtpA81ulz7ppYxfxYOE9H4Pegqib
	 Z7fXwUy0Fyyf5PSq0/KK2pYIjzY0JiEvYCMCgxN0=
Date: Tue, 28 Oct 2025 14:06:19 -0700
From: Johannes Erdfelt <johannes@erdfelt.com>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
Message-ID: <20251028210619.GO15521@sventech.com>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
 <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
User-Agent: Mutt/1.11.4 (2019-03-13)

On Wed, Oct 22, 2025, michael.opdenacker@rootcommit.com <michael.opdenacker@rootcommit.com> wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> The OrangePi RV2 board ships two RGMII ethernet ports.
> Each has an external Motorcomm YT8531C PHY attached, the PHY uses GPIO
> for reset pin control.
> 
> Enable PDMA for the SpacemiT K1-based SoC in the OrangePi RV2 board.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> CC: Emil Renner Berthing <emil.renner.berthing@gmail.com>
> CC: Yixun Lan <dlan@gentoo.org>
> CC: Vivian Wang <wangruikang@iscas.ac.cn>

I tested this patch on my RV2 board. I see similar iperf3 results.

Tested-by: Johannes Erdfelt <johannes@erdfelt.com>

JE

