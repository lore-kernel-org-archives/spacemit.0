Received: from sender4-pp-e107.zoho.com (sender4-pp-e107.zoho.com [136.143.188.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9A32882B4
	for <spacemit@lists.linux.dev>; Mon, 16 Feb 2026 04:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771216836; cv=pass; b=uaC5a1k5IJJBDACPE6Ghe2i7LNS0U75pnbL2r+r/9Q9A/vEe5qOzXpr7YPg3uvAvsP0MgmVBg3qnzWZzZO3VeBPu82Fn8DX4GVqm1VCBvq4IkSs1UFvFCdTtrCqVjOi+FUoaQQ57dm52YXbs8bVTWqgV9VYXPRd9h6hh0+vnLIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771216836; c=relaxed/simple;
	bh=dwoKVpl6ioy/SALJvpxxpzFdHH3Io/eujHQSAMFaXTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNMmTCF6LI4jASAbcjc+6NGRCMzR9K1E6BAki88+7/udWlZrNJe0HGciUI8oXo2Ls5WCrY3GRYpXrYeI3yB3XhAFK4SW6axV4MQMQjivtK8imyYchhQjJcIbDHMl6IQ/oeNZHd9mHUNMQ/3v9f4ZwXPF4vf4zuHLjRKue1iia+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=G4dlI7uf; arc=pass smtp.client-ip=136.143.188.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="G4dlI7uf"
ARC-Seal: i=1; a=rsa-sha256; t=1771216819; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dws1CK1Ncg9xfL/bS9uHyb+7p3KS8L1uqY7QMUaOA0sMjQCoGnZ5ioWSEuNNOf2TbnDg1lw5x6dGXe+QExV7XBvL4moUTYJL+ty3pbEB+O9pOvV7ajEKzsovSghr/7BLAymeY02Pp1F30+O2uNkmGDY8u+i/+xStD6VkJcGP7b0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771216819; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E4yO3rtfux2YLjw+kJJwbVUfdaJfx7vt8Qi+ogorLoo=; 
	b=PssSJJmcWSrgvJU4zlJ4vTHv+I0gbVHZ3AL7AuQ7nVdlQ9kk6QnIqP4nWG5+usMK/cslDitSjX7wnfcKha4Tfj/p9Vv2TkpTEJ6k6cB7jniBwGNSpQgpkjM2SQgYsPWQvgiddoy6qZh/ZqNJOYyh9FBjjV2Xrxm7mJZuUT3lTEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771216819;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=E4yO3rtfux2YLjw+kJJwbVUfdaJfx7vt8Qi+ogorLoo=;
	b=G4dlI7ufZwJI2frTfOUFrNS2HUXmxpcCrDB19BiMj3NUCN6NLqqMhJQLkrm0QQvP
	eYGWT9WpT+Ctm5n8207y1cStIYIwkEc4WscNjcjNiGdWPB3KNF4pp6l+myEw6TBs88A
	cclrcxZn2zeS0zsNzA103SmaqJfXpJgKHe8+Zbow=
Received: by mx.zohomail.com with SMTPS id 1771216817194335.9362570477522;
	Sun, 15 Feb 2026 20:40:17 -0800 (PST)
Date: Mon, 16 Feb 2026 04:39:59 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <aZKfnxXrYVXE8oP4@pie>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
X-ZohoMailClient: External

On Sat, Feb 14, 2026 at 08:29:16PM +0800, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Reviewed-by: Yao Zi <me@ziyao.cc>
