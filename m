Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B71E2307
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 00:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762735947; cv=none; b=ElF+p1S4xDmPOkSni6cxXKCXj6Ia+8stxEkJlykTgzNL0QyCJn6DjX5GSIGH8oXsksC9IfXvXE/vlybgKJ2XNCo7Hp1kes3ifVLh9SABR+/TocUXlNXr3gVNKayUjWOpV9meVHPkZwGOJdWc8GVZxX9QxDfv+TQO/0dif4tj9IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762735947; c=relaxed/simple;
	bh=zZRwUozaRUCWUZ0v/GY/IyfyzQ3GnP7Wcag8gu7TjFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic/9z8eYqMRA4Rhef3Vz22Yp3n8/K66+vNbFPUr1ondzko9DZqannNczCgJBuJBYAbTBB1SBglL6qW9d5CMiMtc6KSUV3R4rkzvWQKGG4C/QVOSbnH/6irZi53hiIrzT7W9YszrLzF+Y4uqGTpgom4tCadN/SEVBfxuyiLcsm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D9DAC340FD9;
	Mon, 10 Nov 2025 00:52:23 +0000 (UTC)
Date: Mon, 10 Nov 2025 08:52:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: add Gigabit Ethernet and PDMA
 to OrangePi R2S
Message-ID: <20251110005213-GYA1651402@gentoo.org>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
 <20251109222858.3085488-4-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109222858.3085488-4-michael.opdenacker@rootcommit.com>

Hi Michael,

Please squash patch 2-4, see previous discussion here [1]
Once you've done this, you could put additional info inside cover letter

Link: https://lore.kernel.org/all/20251010-confider-raven-0ad7a810e5de@spud/ [1]

On 22:30 Sun 09 Nov     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> The OrangePi R2S board includes two RGMII ethernet ports
> supporting Gigabit Ethernet operation.
> 
> They have an external Motorcomm YT8531C PHY attached,
> the PHY uses GPIO for reset pin control. 
..
> Their description
> was reused from the DTS from the OrangePi RV2 board.
Suggest to drop this, useless and even make people confused.

> 
> Enable PDMA for the SpacemiT K1-based SoC.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> ---
> 
> tests on eth0
> -------------
> 
> root@orangepi-rv2-mainline:~# iperf3 -c 172.24.0.1
> Connecting to host 172.24.0.1, port 5201
> [ 5] local 172.24.0.2 port 51354 connected to 172.24.0.1 port 5201
> [ ID] Interval Transfer Bitrate Retr Cwnd
> [ 5] 0.00-1.00 sec 113 MBytes 947 Mbits/sec 0 395 KBytes
> [ 5] 1.00-2.00 sec 113 MBytes 945 Mbits/sec 0 395 KBytes
> [ 5] 2.00-3.00 sec 112 MBytes 936 Mbits/sec 0 395 KBytes
> [ 5] 3.00-4.00 sec 112 MBytes 942 Mbits/sec 0 395 KBytes
> [ 5] 4.00-5.00 sec 112 MBytes 941 Mbits/sec 0 395 KBytes
> [ 5] 5.00-6.00 sec 112 MBytes 940 Mbits/sec 0 409 KBytes
> [ 5] 6.00-7.00 sec 113 MBytes 948 Mbits/sec 0 409 KBytes
> [ 5] 7.00-8.00 sec 112 MBytes 940 Mbits/sec 0 409 KBytes
> [ 5] 8.00-9.00 sec 112 MBytes 941 Mbits/sec 0 414 KBytes
> [ 5] 9.00-10.03 sec 113 MBytes 919 Mbits/sec 0 414 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval Transfer Bitrate Retr
> [ 5] 0.00-10.03 sec 1.10 GBytes 940 Mbits/sec 0 sender
> [ 5] 0.00-10.04 sec 1.10 GBytes 939 Mbits/sec receiver
> 
> iperf Done.
..

-- 
Yixun Lan (dlan)
