Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D9EEC3
	for <spacemit@lists.linux.dev>; Wed, 30 Sep 2026 00:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.99.196.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726492; cv=none; b=hgC2hUa1gzMoDAF2/mATnKV0lvqvY0o7RdAeiIJfX7D9IdbOgQzH7UnI4IvEv08CPhY0MMc2+HLy9AHC/Vc53bcOmJ87uJ6+g6xkyL5kJUJGBpTqxYZZrs+voac2NDijbgQWeyGB9FSMJy/ye+bXYfpjxojzZGNg6IhN1NXMfpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726492; c=relaxed/simple;
	bh=FE4OT4EgAscXlCjfs1qH/WlzmbkSJi5IdXzFPttK0fY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ts7uirTbWLWwYToZCoRvTeth72IDMeXXACgM5HdbLGa3VtHk3J3BsH2cQKa2hzj7XpI0G0AO9RdMCDbeFjmWhamj/B71yRyCKciBUDZMw76p6SrzPVroQ7CUaxCVvK8mc4r/JajxESo3eRb6u+RV3rF5YRLoOwrbB8rkprmuO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org; spf=pass smtp.mailfrom=namei.org; dkim=pass (1024-bit key) header.d=namei.org header.i=@namei.org header.b=bGbCtvOC; arc=none smtp.client-ip=65.99.196.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=namei.org header.i=@namei.org header.b="bGbCtvOC"
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 9D0DD2C5;
	Tue, 29 Sep 2026 23:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 9D0DD2C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1790725938; bh=9Oklwia5HgEZOvXxS1ulCHmSLw8O5GR4I/AE2lHqbUE=;
	h=Date:From:To:Subject:From;
	b=bGbCtvOCi7bXlHEuMcMuiOl07kVoB9QJLjOJhU4dBn8Rcv1Pzn7768OgEjrDrf8yE
	 w+JYNaTnlF5D6QqxiYf0xCQgRa68zQveqvtd6fTgQL0K3yvmrpMUrrg2R7FpJOw6ew
	 bhZob5g3GhwQW4TtnebuU3hrlfUc3O/JSJn8LyP8=
Date: Tue, 29 Sep 2026 16:52:18 -0700 (PDT)
From: James Morris <jmorris@namei.org>
To: devel@lists.fedoraproject.org, linux-riscv@lists.infradead.org, 
    spacemit@lists.linux.dev
Subject: Wiki resource for Fedora RISC-V + KVM on the Spacemit K3 Com260
 board
Message-ID: <b143791b-7bba-a6a4-64ac-9c6dc0735ff3@namei.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Folks,

I've been playing with Fedora RISC-V on the Spacemit K3 Com260 board 
(which implements full virtualization per the RVA23 spec).

I've captured the bringup process as a wiki with the help of an LLM. This 
supports a native KVM host running an F44 guest image. It's current for 
F44, with F45-beta a WIP.

Wiki: https://github.com/xjamesmorris/k3-com260-info/wiki



-- 
James Morris
<jmorris@namei.org>
https://mastodon.social/@xjamesmorris

