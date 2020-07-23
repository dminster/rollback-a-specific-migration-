rake db:rollback STEP=1
Is a way to do this, if the migration you want to rollback is the last one applied. You can substitute 1 for however many migrations you want to go back.

For example:

rake db:rollback STEP=5
Will also rollback all the migration that happened later (4, 3, 2 and also 1).

To roll back all migrations back to (and including) a target migration, use: (This corrected command was added AFTER all the comments pointing out the error in the original post)

rake db:migrate VERSION=20100905201547
In order to rollback ONLY ONE specific migration (OUT OF ORDER) use:

rake db:migrate:down VERSION=20100905201547
Note that this will NOT rollback any interceding migrations -- only the one listed. If that is not what you intended, you can safely run rake db:migrate and it will re-run only that one, skipping any others that were not previously rolled back.

And if you ever want to migrate a single migration out of order, there is also its inverse db:migrate:up:

rake db:migrate:up VERSION=20100905201547
