Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1EB2931D3
	for <spacemit@lists.linux.dev>; Sat, 10 Oct 2026 04:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606703; cv=none; b=OoSjDhGNAq9IRe75R5uyAvauVTV8+nbiYNRBDKcTD63Sp3CQmP+HgtaOoqqpqXyaE1jr3Ukv5Okhj+rcCsyUh+S7VdL587u9TGlYom+GH+wr9YFlY7P+jMHT2PqXKnjeVMPSUA/iDfh4Q1mO9JXsbna2CPkFDJzVmF4vyOFFFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606703; c=relaxed/simple;
	bh=rmdnJjOcKoAsNVmF2MJaGpy6WjPt6VjGBPipfEkoB+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mWEQHf4N9RGEs7f2N4fNSRGRHUgBVn94cXe8SYSRShnlTK78I9tWQU7JwoMbmNGSVDISq1C8T6dlihQdcsFwn/7zHL09g4BORYb7gPeL8/+H/xSaaaG5X9hz9B6/2ArfKcNWe9KG8KMC0yPWnvG8tr3Vg0980IDV1XYJYEO+nJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+hjNUx3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+hjNUx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69641F000FF;
	Sat, 10 Oct 2026 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791606701;
	bh=tWEk3IEHIgQ7BJWbvGYAvaCjn/Tv1q46dwAajVCe0ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l+hjNUx3hW3Q7PBY1oJM2KSJU37ClgZrWLd+y4RvA2BHGZ+onlwlk/dReaOV66RAP
	 IZmr0j3cLbsPX9zRbHbck5XUh/ntfJ10XNgA6ksFYJfuMCsLtRVXzTS2UfYhQSGKqb
	 EizsmIX8QpnQdnMX7WPdwNjzY5YJk72X2/LxUrcdclEvWwTRlx2Px9vQgCy7OYVIZj
	 GurBRdFaBLTAweiToCpcVUFSiRU+DpKbfw1F10SEznEAewKrIalASZRDBC5By8FXu9
	 cNy2BpbJBAn4lM5gMoEX9iXYQV7xeScNxYz9Ey+JeWz1G3ax/2VoPt++e0utUORpH7
	 izUcKSqh5oapQ==
From: Yixun Lan <dlan@kernel.org>
To: u-boot@lists.u-boot-project.org,
	Yixun Lan <dlan@kernel.org>
Cc: Tom Rini <trini@konsulko.com>,
	Jerome Forissier <jerome.forissier@arm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	David Lechner <dlechner@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	fanyi zhang <fanyi.zhang@mediatek.com>,
	E Shattow <e@freeshell.de>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] configs: spacemit: k3: Enable Ethernet support
Date: Sat, 10 Oct 2026 04:31:34 +0000
Message-ID: <179160668562.742055.17000397227078120105.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010-02-k3-ethernet-support-v2-1-af7f55dcf207@kernel.org>
References: <20261010-02-k3-ethernet-support-v2-1-af7f55dcf207@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 Oct 2026 01:52:39 +0000, Yixun Lan wrote:
> Enable the SpacemiT platform glue for the DesignWare Ethernet QoS
> controller together with the generic PHY framework, Gigabit Ethernet
> PHY support and the Realtek PHY driver.
> 
> Enable DHCP, MII, ping and PXE commands for network configuration,
> diagnostics and network boot. Allow U-Boot to generate a random
> Ethernet address when no valid address is provided by the board.
> 
> [...]

Applied, thanks!

[1/1] configs: spacemit: k3: Enable Ethernet support
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/01b0d2681dac9a153b0426290d696166ae999de7

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
