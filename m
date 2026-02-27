Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FD429834
	for <spacemit@lists.linux.dev>; Fri, 27 Feb 2026 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206147; cv=none; b=esNh8PwOBn5RAjwkZueVzQuleKwUieklvjUHiyjHgWqEpkLAJ/+zBl/KFCp/D9CFsF57VyBMlZthGMIO/9aP2ldICjj0XYTcTjTFrHIstuzagKLCQ273Zyakyexc+PT6ZHkzJoUjqwAjjnWETLbf9/Avc/v7FtHKEwS4PLOtdwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206147; c=relaxed/simple;
	bh=4FUTHAlRyMZYX4Z7lWHtCryDYroVmFr+dp0uayHY5Qk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zfl00lBDwHW7NWZh2iKZled0FtptdQfDcGFN5DKu0MOEu0f1IS8+7LqS99z3Tq9Stsochar+inZh2Qdg3YQfHP3ktsisUaEi5wnkcdJ4WNfL/2zyTe8kAfpv8gojFBctdDBMXlvxvHWMxtudLzm6WnM69EHv0uTeC6bcdha/Q/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+SJNGX2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+SJNGX2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6531C19422;
	Fri, 27 Feb 2026 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206146;
	bh=4FUTHAlRyMZYX4Z7lWHtCryDYroVmFr+dp0uayHY5Qk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c+SJNGX2t1/eEJDT4aeRgAsaGiEzev2XVqsQo8mieaXyARrGdmWwv2tbSCH9QjBHQ
	 gByjUXh2eDuizLesdnMcDGVIq+6+fDL5UzukqRT/3oiR1ZB2iDmE+JNQOJF9/ju/4x
	 kThWoaSxOTgUgi/D5q6cdmxw/0eJLzqjN7Kb0uW+8bBp+rHZ5blT1Wq2d9bpV4dOwz
	 GmwkZm22jiExXa5mLsMOBISWPQuySdUicTl+PK3vxxoUOrdZE5K5SdgDs2tWAChm36
	 tk29zu46CgXzBrhUi00zsA0PH9+mvQj0+ee9uDSTwzOvqxIofZWMyrB8d4UOKtON1c
	 ObSEBWPvvGuEg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Alex Elder <elder@riscstar.com>, 
 Ze Huang <huang.ze@linux.dev>, spacemit@lists.linux.dev
In-Reply-To: <20260223064240.386617-1-vkoul@kernel.org>
References: <20260223064240.386617-1-vkoul@kernel.org>
Subject: Re: [PATCH] phy: move spacemit pcie driver to its subfolder
Message-Id: <177220614443.330302.6717419750430502606.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:04 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 23 Feb 2026 12:12:39 +0530, Vinod Koul wrote:
> Commit fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> created spacemit subfolder with usb driver while commit 57e920b92724
> ("phy: spacemit: Introduce PCIe/combo PHY") added pcie driver in phy
> folder. Move latter into spacemit subfolder and rename file to
> phy-k1-pcie.c
> 
> 
> [...]

Applied, thanks!

[1/1] phy: move spacemit pcie driver to its subfolder
      commit: 75fb1a33f9ac4c9730e61bb19aaaab02023a99b2

Best regards,
-- 
~Vinod


