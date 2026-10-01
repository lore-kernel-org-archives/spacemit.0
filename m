Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA95275AEB
	for <spacemit@lists.linux.dev>; Thu,  1 Oct 2026 19:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884236; cv=none; b=YwqrFq4mUvuoVkajIgDcQloZx16BXdHw5kW8nVlaK5udpZKvwPG0NBJ34auoDmMEusZ555NfAdi2uVTrAqU59I84jh+VMea17XLjivxdeUkOUEI3R2s+fWbZYUX4Ia8BYKd+3XOTn0fbAa2jJo/PUrOgSv8DmuRagcPSPl6V24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884236; c=relaxed/simple;
	bh=6jRMKYHfAAX1M9y9r4TRcDkmQYMke6Ra8F2tIGJPUBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ESEWER347w+oBrZ3wpClTwVTzlmHqOj8rXdULSpWPaitYvs7agBfjAdM6PTNoeH8HhmwROZ33Pd/SJK5KbLsDp/PbXix4jwD6YnCKNpM6pN/mksY2eK0JfgF1capMSpVQfK61nfRdRK1PsrowH5l6hyHzja3+Qi9D7+Ees80OmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JzU/jr/8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JzU/jr/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790884233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAjwzoaRE8Y0fVtRj9ggGUm+tsvlfR3rs7Rqyg10Y00=;
	b=JzU/jr/8s7IhqQaS6IvnZNCmudarSNPiZpedJp10ApyBis5Fb0o937b/Fa9VJIwV0OAih9
	OhRwL8jXDSs5F1nYtABbwPf+pbfk/kvT5WGa49HuOBX7nAgXCv4Xb+QyHoR6x+jiiLYbka
	daHnNkDXdwt1xgFZzVkW6jmNoaCMLY4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-NmxrzEmPOeiHp6eRNC39Vw-1; Thu,
 01 Oct 2026 15:50:28 -0400
X-MC-Unique: NmxrzEmPOeiHp6eRNC39Vw-1
X-Mimecast-MFC-AGG-ID: NmxrzEmPOeiHp6eRNC39Vw_1790884227
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9063B18E7558;
	Thu,  1 Oct 2026 19:50:25 +0000 (UTC)
Received: from kchamart.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 564E91956044;
	Thu,  1 Oct 2026 19:50:24 +0000 (UTC)
Date: Thu, 1 Oct 2026 21:50:21 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Development discussions related to Fedora <devel@lists.fedoraproject.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: Wiki resource for Fedora RISC-V + KVM on the Spacemit K3 Com260
 board
Message-ID: <ar65faZP8T-4FOJ4@kchamart.csb>
References: <b143791b-7bba-a6a4-64ac-9c6dc0735ff3@namei.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b143791b-7bba-a6a4-64ac-9c6dc0735ff3@namei.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7UG-Fkw7ezFkC5BmKp9Ub42TAQqjhPA1J00_-BSioY_1790884227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 04:52:18PM -0700, James Morris wrote:
> Hi Folks,

Hi,

> I've been playing with Fedora RISC-V on the Spacemit K3 Com260 board 
> (which implements full virtualization per the RVA23 spec).
>
> I've captured the bringup process as a wiki with the help of an LLM. This 
> supports a native KVM host running an F44 guest image. It's current for 
> F44, with F45-beta a WIP.
> 
> Wiki: https://github.com/xjamesmorris/k3-com260-info/wiki

Thanks for sharing.  I don't have a K3 CoM260 myself, but some folks on
the Fedora RISC-V Matrix have it.

Looking through your wiki, I see you have an elaborate script for the
KVM part.  At first, the name of the script tricked me
('k3-run-fedora-guest.sh').  From quick skimming, I see it is handling a
lot more than just "running" the guest. It handles the entire guest
lifecycle management with plain QEMU, w/o libvirtd, QMP socket
validation, `flock` syscall handling, qcow2 backing file format
validation (a good security instinct :)) and more.


[1] https://github.com/xjamesmorris/k3-com260-info/blob/57400da095e944c75e63154b1c187e18a3ac3359/k3-com260-fedora-howto/scripts/k3-run-fedora-guest.sh


-- 
Kashyap Chamarthy / Red Hat / RISC-V and Fedora

